#tag Module
Protected Module Physics_Tasking
	#tag Method, Flags = &h21
		Private Sub CREATE_VIEWS()
		  Var sql As String = "CREATE OR REPLACE VIEW recent_plan_points AS " _
		  + "SELECT user_id, " _
		  + "(SELECT SUM( " _
		  + "If( 5 * (DATEDIFF(CURDATE(), DATE(due_date)) DIV 7) + " _
		  + "MID('0123334401222334011122340001123400012344001234440', 7 * WEEKDAY(DATE(due_date)) + " _
		  + "WEEKDAY(CURDATE()) + 1, 1) > 0, " _
		  + "Exp(-ln(2)*DATEDIFF( CURDATE(), DATE(due_date)) / " + Physics_Tasking.Half_life_In_Days.ToString +"), 1) " _
		  + " * "  _
		  + App.Points_Plans_Condition + ") " _
		  + "FROM plans INNER JOIN plan_types USING(plan_type_id) " _
		  + "WHERE user_id = users.user_id " _
		  + "AND DATEDIFF( CURDATE(), DATE(assignment_date)) <= " + Physics_Tasking.Points_period_days.ToString + " " _
		  + "AND DATEDIFF( CURDATE(), DATE(assignment_date)) >= 0 ) AS points " _
		  + "FROM users " _
		  + "WHERE is_retired = FALSE " _
		  + "AND category_id In (2,3);"
		  
		  Physics_Tasking.EXECUTE_Statement(sql)
		  
		  
		  
		  sql = "CREATE OR REPLACE VIEW annual_plan_points AS " _
		  + "SELECT user_id, " _
		  + "(SELECT SUM( " _
		  + App.Points_Plans_Condition + ") " _
		  + "FROM plans INNER JOIN plan_types USING(plan_type_id) " _
		  + "WHERE user_id = users.user_id " _
		  + "AND DATEDIFF( CURDATE(), DATE(assignment_date)) <= 365 " _
		  + "AND DATEDIFF( CURDATE(), DATE(assignment_date)) >= 0) AS points " _
		  + "FROM users " _
		  + "WHERE is_retired = FALSE " _
		  + "AND category_id In (2,3);"
		  
		  
		  Physics_Tasking.EXECUTE_Statement(sql)
		  
		  
		  sql = "CREATE OR REPLACE VIEW annual_task_points AS " _
		  + "SELECT user_id, " _
		  + "(SELECT SUM( " _
		  + "weight * multiplier) AS points " _
		  + "FROM tasks INNER JOIN task_types USING(task_type_id) " _
		  + "WHERE user_id = users.user_id " _
		  + "AND DATEDIFF( CURDATE(), DATE(completion_date)) <= 365 " _
		  + "AND DATEDIFF( CURDATE(), DATE(completion_date)) >= 0) AS points " _
		  + "FROM users " _
		  + "WHERE is_retired = FALSE " _
		  + "AND category_id In (2,3);"
		  
		  Physics_Tasking.EXECUTE_Statement(sql)
		  
		  sql = "CREATE OR REPLACE VIEW recent_task_points AS " _
		  + "SELECT user_id, " _
		  + "(SELECT SUM( " _
		  + "weight * multiplier * Exp(-ln(2)*DATEDIFF( CURDATE(), DATE(completion_date))/ " + Physics_Tasking.Half_life_In_Days.ToString +")) AS points " _
		  + "FROM tasks INNER JOIN task_types USING(task_type_id) " _
		  + "WHERE user_id = users.user_id " _
		  + "AND DATEDIFF( CURDATE(), DATE(completion_date)) <= " + Physics_Tasking.Points_period_days.ToString + " " _
		  + "AND DATEDIFF( CURDATE(), DATE(completion_date)) >= 0) AS points " _
		  + "FROM users " _
		  + "WHERE is_retired = FALSE " _
		  + "AND category_id In (2,3);"
		  
		  Physics_Tasking.EXECUTE_Statement(sql)
		  
		  sql = "CREATE OR REPLACE VIEW annual_scheduled_task_points AS " _
		  + "SELECT user_id, " _
		  + "(SELECT SUM( " _
		  + App.Points_Schedulted_Tasks_Condition + " * multiplier) " _
		  + "FROM scheduled_tasks " _
		  + "INNER JOIN task_types Using(task_type_id) " _
		  + "WHERE user_id = users.user_id  " _
		  + "AND is_completed = TRUE " _
		  + "AND DATEDIFF( CURDATE(), DATE(completion_date)) <= 365 " _
		  + "AND DATEDIFF( CURDATE(), DATE(completion_date)) >= 0) AS points " _
		  + "FROM users " _
		  + "WHERE is_retired = FALSE " _
		  + "AND category_id IN (2,3);"
		  
		  Physics_Tasking.EXECUTE_Statement(sql)
		  
		  
		  
		  sql = "CREATE OR REPLACE VIEW recent_scheduled_task_points AS " _
		  + "SELECT user_id, " _
		  + "(SELECT SUM( " _
		  + App.Points_Schedulted_Tasks_Condition + " * multiplier) " _
		  + "FROM scheduled_tasks " _
		  + "INNER JOIN task_types Using(task_type_id) " _
		  + "WHERE user_id = users.user_id  " _
		  + "AND is_completed = TRUE " _
		  + "AND DATEDIFF( CURDATE(), DATE(completion_date)) <= " + Physics_Tasking.Points_period_days.ToString + " " _
		  + "AND DATEDIFF( CURDATE(), DATE(completion_date)) >= 0) AS points " _
		  + "FROM users " _
		  + "WHERE is_retired = FALSE " _
		  + "AND category_id IN (2,3); "
		  
		  Physics_Tasking.EXECUTE_Statement(sql)
		  
		  
		  
		  
		  sql  = "CREATE OR REPLACE VIEW points AS " _
		  + "SELECT user_id, IFNULL(recent_task_points.points, 0) AS recent_task_points, " _
		  + "IFNULL(annual_task_points.points, 0) AS annual_task_points, " _
		  + "IFNULL(recent_scheduled_task_points.points, 0) As recent_scheduled_task_points, " _
		  + "IFNULL(annual_scheduled_task_points.points, 0) AS annual_scheduled_task_points, " _
		  + "IFNULL(recent_plan_points.points, 0) AS recent_plan_points, " _
		  + "IFNULL(annual_plan_points.points, 0) AS annual_plan_points, " _
		  + "(0.9 * (IFNULL(recent_task_points.points, 0) + IFNULL(recent_scheduled_task_points.points, 0)) + " _
		  + "0.1 * (IFNULL(annual_task_points.points, 0) + IFNULL(annual_scheduled_task_points.points, 0))) AS tasks_total, " _
		  + "(0.9 * IFNULL(recent_plan_points.points, 0) + 0.1 * IFNULL(annual_plan_points.points, 0)) AS plans_total, " _
		  + "(0.9 * (IFNULL(recent_task_points.points, 0) + IFNULL(recent_plan_points.points, 0) + IFNULL(recent_scheduled_task_points.points, 0)) + " _
		  + "0.1 * (IFNULL(annual_task_points.points, 0) + IFNULL(annual_plan_points.points, 0) + IFNULL(annual_scheduled_task_points.points, 0))) As total, " _
		  + "is_active " _
		  + "FROM recent_task_points " _
		  + "INNER JOIN annual_task_points USING(user_id) " _
		  + "INNER JOIN recent_scheduled_task_points USING(user_id) " _
		  + "INNER JOIN annual_scheduled_task_points USING(user_id) " _
		  + "INNER JOIN recent_plan_points USING(user_id) " _
		  + "INNER JOIN annual_plan_points USING(user_id) " _
		  + "INNER JOIN users USING(user_id) " _
		  + "ORDER BY total DESC;"
		  
		  Physics_Tasking.EXECUTE_Statement(sql)
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub CREATE_VIEWS_old()
		  Var sql As String = "CREATE OR REPLACE VIEW recent_plan_points AS " _
		  + "SELECT user_id, " _
		  + "(SELECT SUM( " _
		  + "If( 5 * (DATEDIFF(CURDATE(), DATE(due_date)) DIV 7) + " _
		  + "MID('0123334401222334011122340001123400012344001234440', 7 * WEEKDAY(DATE(due_date)) + " _
		  + "WEEKDAY(CURDATE()) + 1, 1) > 0, " _
		  + "Exp(-ln(2)*DATEDIFF( CURDATE(), DATE(due_date)) / " + Physics_Tasking.Half_life_In_Days.ToString +"), 1) " _
		  + " * "  _
		  + "CASE " _
		  + "WHEN plan_types.name LIKE '%Brachytherapy%' " _
		  + "THEN weight " _
		  + "WHEN 5 * (DATEDIFF(DATE(due_date), DATE(assignment_date)) DIV 7) + " _
		  + "MID('0123334401222334011122340001123400012344001234440', 7 * WEEKDAY(DATE(assignment_date)) + " _
		  + "WEEKDAY(DATE(due_date)) + 1, 1) = 0 THEN " _
		  + "weight * 2 " _
		  + "WHEN 5 * (DATEDIFF(DATE(due_date), DATE(assignment_date)) DIV 7) + " _
		  + "MID('0123334401222334011122340001123400012344001234440', 7 * WEEKDAY(DATE(assignment_date)) + " _
		  + "WEEKDAY(DATE(due_date)) + 1, 1) = 1 THEN " _
		  + "weight * 1.5 " _
		  + "WHEN 5 * (DATEDIFF(DATE(due_date), DATE(assignment_date)) DIV 7) + " _
		  + "MID('0123334401222334011122340001123400012344001234440', 7 * WEEKDAY(DATE(assignment_date)) + " _
		  + "WEEKDAY(DATE(due_date)) + 1, 1) = 2 THEN " _
		  + "weight * 1.25 " _
		  + "ELSE " _
		  + "weight " _
		  + "END) " _
		  + "FROM plans INNER JOIN plan_types USING(plan_type_id) " _
		  + "WHERE user_id = users.user_id " _
		  + "AND DATEDIFF( CURDATE(), DATE(assignment_date)) <= " + Physics_Tasking.Points_period_days.ToString + " " _
		  + "AND DATEDIFF( CURDATE(), DATE(assignment_date)) >= 0 ) AS points " _
		  + "FROM users " _
		  + "WHERE is_retired = FALSE " _
		  + "AND category_id In (2,3);"
		  
		  Physics_Tasking.EXECUTE_Statement(sql)
		  
		  
		  
		  sql = "CREATE OR REPLACE VIEW annual_plan_points AS " _
		  + "SELECT user_id, " _
		  + "(SELECT SUM( " _
		  + "CASE " _
		  + "WHEN plan_types.name LIKE '%Brachytherapy%' " _
		  + "THEN weight " _
		  + "WHEN 5 * (DATEDIFF(DATE(due_date), DATE(assignment_date)) DIV 7) + " _
		  + "MID('0123334401222334011122340001123400012344001234440', 7 * WEEKDAY(DATE(assignment_date)) + " _
		  + "WEEKDAY(DATE(due_date)) + 1, 1) = 0 THEN " _
		  + "weight * 2 " _
		  + "WHEN 5 * (DATEDIFF(DATE(due_date), DATE(assignment_date)) DIV 7) + " _
		  + "MID('0123334401222334011122340001123400012344001234440', 7 * WEEKDAY(DATE(assignment_date)) + " _
		  + "WEEKDAY(DATE(due_date)) + 1, 1) = 1 THEN " _
		  + "weight * 1.5 " _
		  + "WHEN 5 * (DATEDIFF(DATE(due_date), DATE(assignment_date)) DIV 7) + " _
		  + "MID('0123334401222334011122340001123400012344001234440', 7 * WEEKDAY(DATE(assignment_date)) + " _
		  + "WEEKDAY(DATE(due_date)) + 1, 1) = 2 THEN " _
		  + "weight * 1.25 " _
		  + "ELSE " _
		  + "weight " _
		  + "END) " _
		  + "FROM plans INNER JOIN plan_types USING(plan_type_id) " _
		  + "WHERE user_id = users.user_id " _
		  + "AND DATEDIFF( CURDATE(), DATE(assignment_date)) <= 365 " _
		  + "AND DATEDIFF( CURDATE(), DATE(assignment_date)) >= 0) AS points " _
		  + "FROM users " _
		  + "WHERE is_retired = FALSE " _
		  + "AND category_id In (2,3);"
		  
		  
		  Physics_Tasking.EXECUTE_Statement(sql)
		  
		  
		  sql = "CREATE OR REPLACE VIEW annual_task_points AS " _
		  + "SELECT user_id, " _
		  + "(SELECT SUM( " _
		  + "weight * multiplier) AS points " _
		  + "FROM tasks INNER JOIN task_types USING(task_type_id) " _
		  + "WHERE user_id = users.user_id " _
		  + "AND DATEDIFF( CURDATE(), DATE(completion_date)) <= 365 " _
		  + "AND DATEDIFF( CURDATE(), DATE(completion_date)) >= 0) AS points " _
		  + "FROM users " _
		  + "WHERE is_retired = FALSE " _
		  + "AND category_id In (2,3);"
		  
		  Physics_Tasking.EXECUTE_Statement(sql)
		  
		  sql = "CREATE OR REPLACE VIEW recent_task_points AS " _
		  + "SELECT user_id, " _
		  + "(SELECT SUM( " _
		  + "weight * multiplier * Exp(-ln(2)*DATEDIFF( CURDATE(), DATE(completion_date))/ " + Physics_Tasking.Half_life_In_Days.ToString +")) AS points " _
		  + "FROM tasks INNER JOIN task_types USING(task_type_id) " _
		  + "WHERE user_id = users.user_id " _
		  + "AND DATEDIFF( CURDATE(), DATE(completion_date)) <= " + Physics_Tasking.Points_period_days.ToString + " " _
		  + "AND DATEDIFF( CURDATE(), DATE(completion_date)) >= 0) AS points " _
		  + "FROM users " _
		  + "WHERE is_retired = FALSE " _
		  + "AND category_id In (2,3);"
		  
		  Physics_Tasking.EXECUTE_Statement(sql)
		  
		  sql = "CREATE OR REPLACE VIEW annual_scheduled_task_points AS " _
		  + "SELECT user_id, " _
		  + "(SELECT SUM( " _
		  + "CASE " _
		  + "WHEN DATEDIFF(DATE(due_date), DATE(completion_date)) < 0 THEN " _
		  + "weight * 0.75 " _
		  + "WHEN DATEDIFF(DATE(due_date), DATE(completion_date)) < 7 THEN " _
		  + "weight " _
		  + "WHEN DATEDIFF(DATE(due_date), DATE(completion_date)) < 14 THEN " _
		  + "weight * 1.25 " _
		  + "WHEN DATEDIFF(DATE(due_date), DATE(completion_date)) < 21 THEN " _
		  + "weight * 1.5 " _
		  + "ELSE " _
		  + "weight * 2 " _
		  + "END * multiplier) " _
		  + "FROM scheduled_tasks " _
		  + "INNER JOIN task_types Using(task_type_id) " _
		  + "WHERE user_id = users.user_id  " _
		  + "AND is_completed = TRUE " _
		  + "AND DATEDIFF( CURDATE(), DATE(completion_date)) <= 365 " _
		  + "AND DATEDIFF( CURDATE(), DATE(completion_date)) >= 0) AS points " _
		  + "FROM users " _
		  + "WHERE is_retired = FALSE " _
		  + "AND category_id IN (2,3);"
		  
		  Physics_Tasking.EXECUTE_Statement(sql)
		  
		  
		  
		  sql = "CREATE OR REPLACE VIEW recent_scheduled_task_points AS " _
		  + "SELECT user_id, " _
		  + "(SELECT SUM( " _
		  + "CASE " _
		  + "WHEN DATEDIFF(DATE(due_date), DATE(completion_date)) < 0 THEN " _
		  + "weight * 0.75 " _
		  + "WHEN DATEDIFF(DATE(due_date), DATE(completion_date)) < 7 THEN " _
		  + "weight " _
		  + "WHEN DATEDIFF(DATE(due_date), DATE(completion_date)) < 14 THEN " _
		  + "weight * 1.25 " _
		  + "WHEN DATEDIFF(DATE(due_date), DATE(completion_date)) < 21 THEN " _
		  + "weight * 1.5 " _
		  + "ELSE " _
		  + "weight * 2 " _
		  + "END * multiplier) " _
		  + "FROM scheduled_tasks " _
		  + "INNER JOIN task_types Using(task_type_id) " _
		  + "WHERE user_id = users.user_id  " _
		  + "AND is_completed = TRUE " _
		  + "AND DATEDIFF( CURDATE(), DATE(completion_date)) <= " + Physics_Tasking.Points_period_days.ToString + " " _
		  + "AND DATEDIFF( CURDATE(), DATE(completion_date)) >= 0) AS points " _
		  + "FROM users " _
		  + "WHERE is_retired = FALSE " _
		  + "AND category_id IN (2,3); "
		  
		  Physics_Tasking.EXECUTE_Statement(sql)
		  
		  
		  
		  
		  sql  = "CREATE OR REPLACE VIEW points AS " _
		  + "SELECT user_id, IFNULL(recent_task_points.points, 0) AS recent_task_points, " _
		  + "IFNULL(annual_task_points.points, 0) AS annual_task_points, " _
		  + "IFNULL(recent_scheduled_task_points.points, 0) As recent_scheduled_task_points, " _
		  + "IFNULL(annual_scheduled_task_points.points, 0) AS annual_scheduled_task_points, " _
		  + "IFNULL(recent_plan_points.points, 0) AS recent_plan_points, " _
		  + "IFNULL(annual_plan_points.points, 0) AS annual_plan_points, " _
		  + "(0.9 * (IFNULL(recent_task_points.points, 0) + IFNULL(recent_scheduled_task_points.points, 0)) + " _
		  + "0.1 * (IFNULL(annual_task_points.points, 0) + IFNULL(annual_scheduled_task_points.points, 0))) AS tasks_total, " _
		  + "(0.9 * IFNULL(recent_plan_points.points, 0) + 0.1 * IFNULL(annual_plan_points.points, 0)) AS plans_total, " _
		  + "(0.9 * (IFNULL(recent_task_points.points, 0) + IFNULL(recent_plan_points.points, 0) + IFNULL(recent_scheduled_task_points.points, 0)) + " _
		  + "0.1 * (IFNULL(annual_task_points.points, 0) + IFNULL(annual_plan_points.points, 0) + IFNULL(annual_scheduled_task_points.points, 0))) As total, " _
		  + "is_active " _
		  + "FROM recent_task_points " _
		  + "INNER JOIN annual_task_points USING(user_id) " _
		  + "INNER JOIN recent_scheduled_task_points USING(user_id) " _
		  + "INNER JOIN annual_scheduled_task_points USING(user_id) " _
		  + "INNER JOIN recent_plan_points USING(user_id) " _
		  + "INNER JOIN annual_plan_points USING(user_id) " _
		  + "INNER JOIN users USING(user_id) " _
		  + "ORDER BY total DESC;"
		  
		  Physics_Tasking.EXECUTE_Statement(sql)
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Days_To_Start_Date(due_date as DateTime) As Integer
		  
		  Var Temp As DateTime = DateTime.Now
		  Var Today As New DateTime(Temp.Year, Temp.Month, Temp.Day)
		  
		  
		  Var No_of_days As Integer = 0
		  
		  While Today < Due_Date
		    
		    If Today.DayOfWeek <= 5 Then No_of_days = No_of_days + 1
		    Today = Today.AddInterval( 0,0,1 )
		    
		  Wend
		  
		  Return No_of_days
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub EXECUTE_Statement(sql as String)
		  
		  Var db As New MySQLCommunityServer
		  db.Host = Physics_Tasking.db_host
		  db.Port = Physics_Tasking.db_port
		  db.DatabaseName = Physics_Tasking.db_name
		  db.UserName = Physics_Tasking.db_username
		  db.Password = Physics_Tasking.db_password
		  
		  If Not sql.EndsWith(";") Then sql = sql + ";"
		  
		  Try
		    
		    If db.Connect Then
		      
		      db.ExecuteSQL(sql)
		      
		    End If
		    
		    db.Close
		    
		  Catch de As DatabaseException
		    
		    If de.ErrorNumber = 48879 Then
		      
		      Var waitUntil As Integer = Ticks + 15
		      
		      While Ticks < waitUntil
		        
		      Wend
		      
		      Physics_Tasking.EXECUTE_Statement(sql)
		    Else
		      
		      Var theDialog As New MessageWebDialog
		      theDialog.Message_Label.Text = "Database error: (" + de.ErrorNumber.ToString + ") " + de.Message + "."
		      theDialog.Show
		      
		    End If
		    
		  Catch noe As NilObjectException
		    
		    Var theDialog As New MessageWebDialog
		    theDialog.Message_Label.Text = "Database error: (" + noe.ErrorNumber.ToString + ") " + noe.Message + "."
		    theDialog.Show
		    
		  End Try
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Get_Plan_Assignement_Probability(user_id as integer) As Double
		  Var sum As Double = 0
		  
		  Var s  as Double = 0
		  Var m As Double = 0
		  Var count As Integer = 0
		  
		  Var d As DateTime = DateTime.Now
		  
		  For Each item As Physics_Tasking.CLASS_User_Record In Physics_Tasking.Users
		    
		    If (item.Group.id = 2 Or item.Group.id = 3) _
		      And item.isActive _
		      And Not item.isRetired  Then
		      
		      
		      Var x As Double = item.GET_Total_Points(d)
		      
		      If count = 0 Then
		        
		        m = x
		        s = 0
		        
		      Else
		        
		        Var m_1 As Double = m
		        m = m_1 + ( x - m_1) / ( count + 1)
		        Var s_1 As Double = s
		        s = s_1 + ( x - m_1) * ( x - m)    
		        
		      End If
		      
		      sum = sum + x
		      count = count + 1
		      
		    End If
		    
		  Next
		  
		  // If active users are 0 or 1
		  If count = 0 Then
		    
		    Return 0
		    
		  ElseIf count = 1 Then
		    
		    Return 1 
		    
		  Else
		    
		    
		    Var avg As Double = sum / count
		    Var std As Double  = Sqrt( s / ( count - 1) )
		    
		    Var p11 As Double = Numerical_Recipies.Cummulative_Normal_Distribution(2.0)
		    Var p1 As Double = Numerical_Recipies.Cummulative_Normal_Distribution(1.0)
		    
		    Var p2 As Double = Numerical_Recipies.Cummulative_Normal_Distribution(0)
		    Var p3 As Double = Numerical_Recipies.Cummulative_Normal_Distribution(-1.0)
		    Var p4 As Double = Numerical_Recipies.Cummulative_Normal_Distribution(-2.0)
		    
		    
		    
		    If std = 0 Then 
		      
		      //if std is 0 then return 1/count (equal probability)
		      Return 1/count
		      
		    Else
		      
		      Var normalization As Double = 0
		      
		      For Each item As Physics_Tasking.CLASS_User_Record In Physics_Tasking.Users
		        If (item.Group.id = 2 Or item.Group.id = 3) And item.isActive Then
		          
		          Var z As Double = (item.GET_Total_Points( d) - avg)/std
		          Var p As Double = 1 - Numerical_Recipies.Cummulative_Normal_Distribution(z)
		          normalization = normalization + p
		          
		        End If
		      Next
		      
		      For Each item As Physics_Tasking.CLASS_User_Record In Physics_Tasking.Users
		        
		        If user_id = item.id Then
		          
		          Var z As Double = (item.GET_Total_Points( d) - avg)/std
		          Var p As Double = Numerical_Recipies.Cummulative_Normal_Distribution(z)
		          
		          Return (1- p) / normalization
		          
		        End If
		      Next
		      
		      
		    End If
		    
		    
		  End If
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Get_Points_Avg(d As DateTime) As Double
		  Try
		    
		    Var count As Integer = 0
		    Var sum As Double = 0.0
		    
		    For Each item As Physics_Tasking.CLASS_User_Record In Physics_Tasking.Users
		      
		      If ( item.Group.id = 2 Or item.Group.id = 3) _
		        And item.isActive _
		        And Not item.isRetired Then
		        
		        count = count + 1
		        sum = sum + item.GET_Total_Points(d)
		        
		      End If
		      
		    Next item
		    
		    
		    If count = 0 Then
		      
		      Return 0
		      
		    Else
		      
		      Return sum/count
		      
		    End If
		    
		    
		    
		  End Try
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GET_Random_Planner() As integer
		  Var sum_points As Double = 0
		  Var count As Integer = 0
		  Var user_id() As Integer
		  Var prob() As Double
		  Var cum_prob() As Double
		  
		  For Each item As Physics_Tasking.CLASS_User_Record In Physics_Tasking.Users
		    
		    If item.isActive And (item.Group.id = 2 Or item.Group.id = 3) Then
		      
		      user_id.Append( item.id)
		      prob.Append( Physics_Tasking.Get_Plan_Assignement_Probability(item.id))
		      
		    End If
		    
		  Next item
		  
		  If user_id.Count >= 1 Then
		    
		    cum_prob.Append( prob(0))
		    
		    For i As Integer = 1 To user_id.LastIndex
		      
		      cum_prob.Append(prob(i) + cum_prob(i - 1))
		      
		    Next i
		    
		  End If
		  
		  
		  Var r As Double = System.Random.Number
		  
		  For i As Integer = 0 To user_id.LastIndex
		    
		    If r <= cum_prob(i) Then return user_id(i)
		    
		    
		  Next i
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub INSERT_Row(table as String, row as DatabaseRow)
		  
		  Var db As New MySQLCommunityServer
		  db.Host = Physics_Tasking.db_host
		  db.Port = Physics_Tasking.db_port
		  db.DatabaseName = Physics_Tasking.db_name
		  db.UserName = Physics_Tasking.db_username
		  db.Password = Physics_Tasking.db_password
		  
		  
		  
		  
		  Try
		    
		    If db.Connect Then
		      
		      
		      db.AddRow( table, row)
		      
		    End If
		    
		    
		    db.Close
		    
		  Catch de As DatabaseException
		    
		    If de.ErrorNumber = 48879 Then
		      
		      Var waitUntil As Integer = Ticks + 15
		      
		      While Ticks < waitUntil
		        
		      Wend
		      
		      If db.Connect Then
		        
		        db.AddRow( table, row)
		        
		      End If
		    Else
		      
		      Var theDialog As New MessageWebDialog
		      theDialog.Message_Label.Text = "Database error: (" + de.ErrorNumber.ToString + ") " + de.Message + "."
		      theDialog.Show
		      
		    End If
		    
		  Catch noe As NilObjectException
		    
		    Var theDialog As New MessageWebDialog
		    theDialog.Message_Label.Text = "Database error: (" + noe.ErrorNumber.ToString + ") " + noe.Message + "."
		    theDialog.Show
		    
		  End Try
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub POPULATE_Groups()
		  
		  
		  Var id_list As String = "0"
		  
		  For Each item As Physics_Tasking.CLASS_Group_Record In Physics_Tasking.Groups
		    
		    id_list = id_list + "," + item.id.ToString
		    
		  Next
		  
		  Var sql As String = "SELECT category_id " _
		  +"FROM physics_tasking.categories WHERE category_id NOT IN (" + id_list + ");"
		  
		  
		  Var rs As RowSet = Physics_Tasking.SELECT_Statement(sql)
		  
		  While Not rs.AfterLastRow
		    
		    
		    Physics_Tasking.Groups.Append(New Physics_Tasking.CLASS_Group_Record)
		    Physics_Tasking.Groups( Physics_Tasking.Groups.LastIndex).id = rs.Column("category_id").IntegerValue
		    
		    rs.MoveToNextRow
		    
		  Wend
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub POPULATE_Main_Data()
		  UPDATE_Database_Tables
		  POPULATE_Groups
		  POPULATE_Users
		  
		  
		  
		  
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub POPULATE_Users()
		  
		  Var id_list As String = "0"
		  
		  For Each item As Physics_Tasking.CLASS_User_Record In Physics_Tasking.Users
		    
		    id_list = id_list + "," + item.id.ToString
		    
		  Next
		  
		  
		  Var sql As String = "SELECT user_id " _
		  +"FROM physics_tasking.users WHERE user_id NOT IN (" + id_list + ");"
		  
		  Var rs As RowSet = Physics_Tasking.SELECT_Statement( sql)
		  
		  
		  While Not rs.AfterLastRow
		    
		    Physics_Tasking.Users.Add( New Physics_Tasking.CLASS_User_Record)
		    Physics_Tasking.Users( Physics_Tasking.Users.LastIndex).id = _
		    rs.Column("user_id").IntegerValue
		    
		    
		    
		    rs.MoveToNextRow
		    
		  Wend
		  
		  Physics_Tasking.Users.Sort( AddressOf Physics_Tasking.SORT_User_Records_Name )
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RETURN_Login_User_ID(login as String, password as String) As Integer
		  
		  Var db As New MySQLCommunityServer
		  db.Host = Physics_Tasking.db_host
		  db.Port = Physics_Tasking.db_port
		  db.DatabaseName = Physics_Tasking.db_name
		  db.UserName = Physics_Tasking.db_username
		  db.Password = Physics_Tasking.db_password
		  
		  Try
		    If db.Connect Then
		      
		      
		      Var ps As  PreparedSQLStatement = _
		      db.Prepare("SELECT user_id FROM physics_tasking.users WHERE " _
		      + "login = ? AND password = ?")
		      
		      ps.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_STRING)
		      ps.BindType(1, MySQLPreparedStatement.MYSQL_TYPE_BLOB)
		      
		      
		      Var rs As RowSet = ps.SelectSQL(login, Crypto.Hash(password, Crypto.Algorithm.SHA512) )
		      
		      If rs.RowCount = 0 Then Return 0
		      Return rs.Column("user_id").IntegerValue
		      
		    End If
		    
		  Catch de As DatabaseException
		    
		    If de.ErrorNumber = 48879 Then
		      
		      Var waitUntil As Integer = Ticks + 15
		      
		      While Ticks < waitUntil
		        
		      Wend
		      
		      Return Physics_Tasking.RETURN_Login_User_ID(login, password)
		    Else
		      
		      Var theDialog As New MessageWebDialog
		      theDialog.Message_Label.Text = "Database error: (" + de.ErrorNumber.ToString + ") " + de.Message + "."
		      theDialog.Show
		      
		    End If
		    
		  Catch noe As NilObjectException
		    
		    Var theDialog As New MessageWebDialog
		    theDialog.Message_Label.Text = "Database error: (" + noe.ErrorNumber.ToString + ") " + noe.Message + "."
		    theDialog.Show
		    
		  End Try
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SELECT_Statement(sql as String) As RowSet
		  Var db As New MySQLCommunityServer
		  db.Host = Physics_Tasking.db_host
		  db.Port = Physics_Tasking.db_port
		  db.DatabaseName = Physics_Tasking.db_name
		  db.UserName = Physics_Tasking.db_username
		  db.Password = Physics_Tasking.db_password
		  
		  
		  If Not sql.EndsWith(";") Then sql = sql + ";"
		  
		  Try
		    
		    If db.Connect Then
		      
		      Var rs As RowSet = db.SelectSQL(sql)
		      
		      While rs = Nil
		        
		        rs  = db.SelectSQL(sql)
		        
		      Wend
		      
		      
		      Return rs
		      
		    End If
		    
		    db.Close
		    
		  Catch de As DatabaseException
		    
		    If de.ErrorNumber = 48879 Then
		      
		      Var waitUntil As Integer = Ticks + 15
		      
		      While Ticks < waitUntil
		        
		      Wend
		      
		      Return Physics_Tasking.SELECT_Statement(sql)
		    Else
		      
		      Var theDialog As New MessageWebDialog
		      theDialog.Message_Label.Text = "Database error: (" + de.ErrorNumber.ToString + ") " + de.Message + "."
		      theDialog.Show
		      
		    End If
		    
		  Catch noe As NilObjectException
		    
		    Var theDialog As New MessageWebDialog
		    theDialog.Message_Label.Text = "Database error: (" + noe.ErrorNumber.ToString + ") " + noe.Message + "."
		    theDialog.Show
		    
		  End Try
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SORT_Plans_Completed_Date(Plan1 as Physics_Tasking.CLASS_Plan_Record, Plan2 as Physics_Tasking.CLASS_Plan_Record) As Integer
		  
		  If Plan1.Completion_Date.SecondsFrom1970 > Plan2.Completion_Date.SecondsFrom1970 Then
		    
		    Return -1
		    
		  ElseIf Plan1.Completion_Date.SecondsFrom1970 < Plan2.Completion_Date.SecondsFrom1970 Then
		    
		    Return 1
		    
		  Else
		    
		    Return 0
		    
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SORT_Plans_Due_Date(Plan1 as Physics_Tasking.CLASS_Plan_Record, Plan2 as Physics_Tasking.CLASS_Plan_Record) As Integer
		  
		  If Plan1.Due_Date.SecondsFrom1970 < Plan2.Due_Date.SecondsFrom1970 Then
		    
		    Return -1
		    
		  Elseif Plan1.Due_Date.SecondsFrom1970 > Plan2.Due_Date.SecondsFrom1970 Then
		    
		    Return 1
		    
		  Else
		    
		    Return 0
		    
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SORT_Plan_Type_Record_Name(Plan_Type1 as Physics_Tasking.CLASS_Plan_Type_Record, Plan_Type2 as Physics_Tasking.CLASS_Plan_Type_Record) As integer
		  
		  If Plan_Type1.name > Plan_Type2.name Then
		    
		    Return 1
		    
		  ElseIf Plan_Type1.name < Plan_Type2.name Then
		    
		    Return -1
		    
		  Else
		    
		    Return 0
		    
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SORT_Site_Records_Name(Site1 as Physics_Tasking.CLASS_Site_Record, Site2 as Physics_Tasking.CLASS_Site_Record) As integer
		  
		  If Site1.name > Site2.name Then
		    
		    Return 1
		    
		  Elseif Site1.name < Site2.name Then
		    
		    Return -1
		    
		  Else
		    
		    Return 0
		    
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SORT_Task_Records_Date(Task1 as Physics_Tasking.CLASS_Task_Record, Task2 as Physics_Tasking.CLASS_Task_Record) As Integer
		  
		  If Task1.Completion_Date.SecondsFrom1970 < Task2.Completion_Date.SecondsFrom1970 Then
		    
		    Return 1
		    
		  ElseIf Task1.Completion_Date.SecondsFrom1970 > Task2.Completion_Date.SecondsFrom1970 Then
		    
		    Return -1
		    
		  Else
		    
		    Return 0
		    
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SORT_Task_Type_Record_Name(Task_Type1 as Physics_Tasking.CLASS_Task_type_record, Task_Type2 as Physics_Tasking.CLASS_Task_type_record) As integer
		  
		  If Task_Type1.Task_Group_Record.name.Trim.Lowercase + " " + Task_Type1.name.Trim.Lowercase  > _
		    Task_Type2.Task_Group_Record.name.Trim.Lowercase + " " + Task_Type2.name.Trim.Lowercase Then
		    
		    Return 1
		    
		  ElseIf Task_Type1.Task_Group_Record.name.Trim.Lowercase + " " + Task_Type1.name.Trim.Lowercase  < _
		    Task_Type2.Task_Group_Record.name.Trim.Lowercase + " " + Task_Type2.name.Trim.Lowercase Then
		    
		    Return -1
		    
		  Else
		    
		    Return 0
		    
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SORT_User_Records_Name(User1 as Physics_Tasking.CLASS_User_Record, User2 as Physics_Tasking.CLASS_User_Record) As integer
		  
		  If User1.full_name > User2.full_name Then
		    
		    Return 1
		    
		  Elseif User1.full_name < User2.full_name Then
		    
		    Return -1
		    
		  Else
		    
		    Return 0
		    
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SORT_User_Records_points(User1 as Physics_Tasking.CLASS_User_Record, User2 as Physics_Tasking.CLASS_User_Record) As integer
		  Var d As DateTime = DateTime.Now
		  
		  If User1.GET_Total_Points(d) > User2.GET_Total_Points(d) Then
		    
		    Return -1
		    
		  ElseIf User1.GET_Total_Points(d) < User2.GET_Total_Points(d) Then
		    
		    Return 1
		    
		  Else
		    
		    Return 0
		    
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UPDATE_Database_Tables()
		  
		  UPDATE_General_Information
		  UPDATE_Vacations
		  UPDATE_Groups
		  UPDATE_Users
		  UPDATE_Machines
		  UPDATE_Vacations
		  UPDATE_On_Call
		  
		  
		  UPDATE_Task_Groups
		  UPDATE_Task_Types
		  UPDATE_Tasks
		  UPDATE_Scheduled_Tasks
		  
		  UPDATE_Sites
		  UPDATE_Plan_Types
		  
		  UPDATE_Patients
		  UPDATE_Plans
		  
		  
		  
		  
		  UPDATE_TimeLogs
		  UPDATE_OverTime_Types
		  UPDATE_OverTime
		  UPDATE_TimeBack
		  
		  CREATE_VIEWS
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub UPDATE_General_Information()
		  // Create General Information table
		  
		  
		  Var sql As String = "CREATE TABLE IF NOT EXISTS physics_tasking.general_information (" _
		  +"general_information_id INT AUTO_INCREMENT, " _
		  +"hospital_name VARCHAR(100) NOT NULL, " _
		  +"department_name VARCHAR(100) NOT NULL, " _
		  +"section_name VARCHAR(100) NOT NULL, " _
		  +"hospital_logo BLOB, " _
		  +"random_seed  INT UNSIGNED NOT NULL DEFAULT 17327, " _
		  +"PRIMARY KEY (general_information_id));"
		  
		  Physics_Tasking.EXECUTE_Statement( sql)
		  
		  
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub UPDATE_Groups()
		  
		  
		  // Create Groups Table
		  Var sql As String = "CREATE TABLE IF NOT EXISTS physics_tasking.categories (" _
		  +"category_id INT AUTO_INCREMENT, " _
		  +"name VARCHAR(50) NOT NULL UNIQUE, " _
		  +"PRIMARY KEY (category_id));"
		  Physics_Tasking.EXECUTE_Statement( sql)
		  
		  sql = "INSERT INTO physics_tasking.categories (name) " _
		  +"SELECT * FROM (SELECT 'administrator') AS tmp " _
		  +"WHERE Not EXISTS (SELECT name FROM physics_tasking.categories " _
		  +"WHERE name = 'administrator') LIMIT 1"
		  
		  Physics_Tasking.EXECUTE_Statement( sql)
		  
		  sql = "INSERT INTO physics_tasking.categories (name) " _
		  +"SELECT * FROM (SELECT 'physicist') AS tmp " _
		  +"WHERE Not EXISTS (SELECT name FROM physics_tasking.categories " _
		  +"WHERE name = 'physicist') LIMIT 1"
		  
		  Physics_Tasking.EXECUTE_Statement( sql)
		  
		  sql = "INSERT INTO physics_tasking.categories (name) " _
		  +"SELECT * FROM (SELECT 'dosimetrist') AS tmp " _
		  +"WHERE Not EXISTS (SELECT name FROM physics_tasking.categories " _
		  +"WHERE name = 'dosimetrist') LIMIT 1"
		  
		  Physics_Tasking.EXECUTE_Statement( sql)
		  
		  sql = "INSERT INTO physics_tasking.categories (name) " _
		  +"SELECT * FROM (SELECT 'therapist') AS tmp " _
		  +"WHERE Not EXISTS (SELECT name FROM physics_tasking.categories " _
		  +"WHERE name = 'therapist') LIMIT 1"
		  
		  Physics_Tasking.EXECUTE_Statement( sql)
		  
		  sql = "INSERT INTO physics_tasking.categories (name) " _
		  +"SELECT * FROM (SELECT 'physician') AS tmp " _
		  +"WHERE Not EXISTS (SELECT name FROM physics_tasking.categories " _
		  +"WHERE name = 'physician') LIMIT 1"
		  
		  Physics_Tasking.EXECUTE_Statement( sql)
		  
		  
		  
		  
		  
		  
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub UPDATE_Machines()
		  // Create machines Table
		  Var sql As String = "CREATE TABLE IF NOT EXISTS machines (" _
		  +"machine_id INT AUTO_INCREMENT, " _
		  +"name VARCHAR(50) NOT NULL UNIQUE, " _
		  +"PRIMARY KEY (machine_id));"
		  Physics_Tasking.EXECUTE_Statement( sql)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub UPDATE_On_Call()
		  // Create General Information table
		  
		  
		  Var sql As String = "CREATE TABLE IF NOT EXISTS physics_tasking.on_calls (" _
		  +"on_call_date DATE NOT NULL, " _
		  +"user_id INTEGER NOT NULL, "_
		  +"PRIMARY KEY (on_call_date), " _
		  +"FOREIGN KEY (user_id) REFERENCES users(user_id) " _
		  +"ON UPDATE NO ACTION ON DELETE NO ACTION);"
		  
		  Physics_Tasking.EXECUTE_Statement( sql)
		  
		  
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub UPDATE_OverTime()
		  
		  
		  // Create OverTime Table
		  Var sql As String = "CREATE TABLE IF NOT EXISTS physics_tasking.overtimes (" _
		  +"overtime_id INT AUTO_INCREMENT, " _
		  +"overtime_type_id INT NOT NULL, " _
		  +"notes VARCHAR(500) NOT NULL, " _
		  +"time_in DATETIME NOT NULL, " _
		  +"time_out DATETIME NOT NULL, " _
		  +"user_id INT NOT NULL, " _
		  +"PRIMARY KEY (overtime_id), " _
		  +"FOREIGN KEY (user_id) REFERENCES users(user_id), " _
		  +"FOREIGN KEY (overtime_type_id) REFERENCES overtime_types(overtime_type_id) " _
		  +"ON UPDATE NO ACTION ON DELETE NO ACTION);"
		  
		  Physics_Tasking.EXECUTE_Statement( sql)
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub UPDATE_OverTime_Types()
		  
		  
		  // Create OverTime Table
		  Var sql As String = "CREATE TABLE IF NOT EXISTS physics_tasking.overtime_types (" _
		  +"overtime_type_id INT AUTO_INCREMENT, " _
		  +"name VARCHAR(100) NOT NULL, " _
		  +"PRIMARY KEY (overtime_type_id));"
		  
		  Physics_Tasking.EXECUTE_Statement( sql)
		  
		  sql = "INSERT INTO physics_tasking.overtime_types (name) " _
		  +"SELECT * FROM (SELECT 'Other') AS tmp " _
		  +"WHERE Not EXISTS (SELECT name FROM physics_tasking.overtime_types " _
		  +"WHERE name = 'Other') LIMIT 1"
		  
		  Physics_Tasking.EXECUTE_Statement( sql)
		  sql = "INSERT INTO physics_tasking.overtime_types (name) " _
		  +"SELECT * FROM (SELECT 'TrueBeam_Rose') AS tmp " _
		  +"WHERE Not EXISTS (SELECT name FROM physics_tasking.overtime_types " _
		  +"WHERE name = 'TrueBeam_Rose') LIMIT 1"
		  
		  Physics_Tasking.EXECUTE_Statement( sql)
		  
		  sql = "INSERT INTO physics_tasking.overtime_types (name) " _
		  +"SELECT * FROM (SELECT 'TrueBeam_Ocean') AS tmp " _
		  +"WHERE Not EXISTS (SELECT name FROM physics_tasking.overtime_types " _
		  +"WHERE name = 'TrueBeam_Ocean') LIMIT 1"
		  
		  Physics_Tasking.EXECUTE_Statement( sql)
		  
		  sql = "INSERT INTO physics_tasking.overtime_types (name) " _
		  +"SELECT * FROM (SELECT 'GammaMedPlus') AS tmp " _
		  +"WHERE Not EXISTS (SELECT name FROM physics_tasking.overtime_types " _
		  +"WHERE name = 'GammaMedPlus') LIMIT 1"
		  
		  Physics_Tasking.EXECUTE_Statement( sql)
		  
		  sql = "INSERT INTO physics_tasking.overtime_types (name) " _
		  +"SELECT * FROM (SELECT 'GE CT-Simulator') AS tmp " _
		  +"WHERE Not EXISTS (SELECT name FROM physics_tasking.overtime_types " _
		  +"WHERE name = 'GE CT-Simulator') LIMIT 1"
		  
		  Physics_Tasking.EXECUTE_Statement( sql)
		  
		  sql = "INSERT INTO physics_tasking.overtime_types (name) " _
		  +"SELECT * FROM (SELECT 'PSQA') AS tmp " _
		  +"WHERE Not EXISTS (SELECT name FROM physics_tasking.overtime_types " _
		  +"WHERE name = 'GE CT-Simulator') LIMIT 1"
		  
		  Physics_Tasking.EXECUTE_Statement( sql)
		  
		  sql = "INSERT INTO physics_tasking.overtime_types (name) " _
		  +"SELECT * FROM (SELECT 'Device Calibration') AS tmp " _
		  +"WHERE Not EXISTS (SELECT name FROM physics_tasking.overtime_types " _
		  +"WHERE name = 'Device Calibration') LIMIT 1"
		  
		  Physics_Tasking.EXECUTE_Statement( sql)
		  
		  sql = "INSERT INTO physics_tasking.overtime_types (name) " _
		  +"SELECT * FROM (SELECT 'Treatment Planning') AS tmp " _
		  +"WHERE Not EXISTS (SELECT name FROM physics_tasking.overtime_types " _
		  +"WHERE name = 'Treatment Planning') LIMIT 1"
		  
		  Physics_Tasking.EXECUTE_Statement( sql)
		  
		  sql = "INSERT INTO physics_tasking.overtime_types (name) " _
		  +"SELECT * FROM (SELECT 'Emergency Treatment') AS tmp " _
		  +"WHERE Not EXISTS (SELECT name FROM physics_tasking.overtime_types " _
		  +"WHERE name = 'Emergency Treatment') LIMIT 1"
		  
		  Physics_Tasking.EXECUTE_Statement( sql)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub UPDATE_Patients()
		  
		  
		  // Create patients Table
		  Var sql As String = "CREATE TABLE IF NOT EXISTS physics_tasking.patients (" _
		  +"patient_id INT AUTO_INCREMENT, " _
		  +"first_name VARCHAR(50), " _
		  +"family_name VARCHAR(50), " _
		  +"mrn VARCHAR(15) NOT NULL UNIQUE, " _
		  +"PRIMARY KEY (patient_id));"
		  
		  Physics_Tasking.EXECUTE_Statement( sql)
		  
		  
		  
		  //Add indexes
		  
		  sql = "SELECT COUNT(1) IndexIsThere FROM INFORMATION_SCHEMA.STATISTICS " _
		  + "WHERE table_schema='physics_tasking' AND table_name='patients' AND index_name='idx_mrn';"
		  
		  Var rs As RowSet = Physics_Tasking.SELECT_Statement( sql)
		  
		  If rs.Column( "IndexIsThere").IntegerValue = 0 Then
		    
		    sql = "CREATE INDEX idx_mrn " _
		    + "ON physics_tasking.patients (mrn);"
		    
		    Physics_Tasking.EXECUTE_Statement( sql)
		    
		    
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub UPDATE_Plans()
		  
		  // Create Plan Table
		  Var sql As String = "CREATE TABLE IF NOT EXISTS physics_tasking.plans (" _
		  + "plan_id INT UNSIGNED AUTO_INCREMENT, " _
		  + "patient_id INT NOT NULL, " _
		  + "plan_type_id INT NOT NULL, " _
		  + "user_id INT NOT NULL, " _
		  + "assignment_date DATETIME NOT NULL, "_
		  + "assigned_by_id INT NOT NULL, " _
		  + "due_date DATE NOT NULL, " _
		  + "is_completed BOOLEAN NOT NULL DEFAULT FALSE, " _
		  + "completion_date DATETIME, " _
		  + "notes TEXT, "_
		  + "PRIMARY KEY (plan_id), " _
		  + "FOREIGN KEY (plan_type_id) REFERENCES plan_types(plan_type_id) " _
		  + "ON UPDATE NO ACTION ON DELETE NO ACTION, " _
		  + "FOREIGN KEY (assigned_by_id) REFERENCES users(user_id) " _
		  + "ON UPDATE NO ACTION ON DELETE NO ACTION, " _
		  + "FOREIGN KEY (patient_id) REFERENCES patients(patient_id) " _
		  + "ON UPDATE NO ACTION ON DELETE NO ACTION, " _
		  + "FOREIGN KEY (user_id) REFERENCES users(user_id) " _
		  + "ON UPDATE NO ACTION ON DELETE NO ACTION);"
		  
		  Physics_Tasking.EXECUTE_Statement( sql)
		  
		  
		  // Add is_replan column
		  
		  sql = "SHOW COLUMNS FROM physics_tasking.plans "  _
		  + "LIKE 'is_replan';"
		  Var rs As RowSet= Physics_Tasking.SELECT_Statement( sql)
		  
		  If rs.RowCount = 0 Then
		    
		    sql = "ALTER TABLE physics_tasking.plans " _
		    + "ADD COLUMN is_replan BOOLEAN NOT NULL DEFAULT FALSE;"
		    Physics_Tasking.EXECUTE_Statement( sql)
		    
		  End If
		  
		  // Add physician column
		  
		  sql = "SHOW COLUMNS FROM physics_tasking.plans "  _
		  + "LIKE 'physician_id';"
		  rs = Physics_Tasking.SELECT_Statement( sql)
		  
		  If rs.RowCount = 0 Then
		    
		    sql = "ALTER TABLE physics_tasking.plans " _
		    + "ADD COLUMN physician_id INTEGER;"
		    Physics_Tasking.EXECUTE_Statement( sql)
		    sql = "ALTER TABLE physics_tasking.plans " _
		    + "ADD FOREIGN KEY (physician_id) REFERENCES users(user_id);"
		    Physics_Tasking.EXECUTE_Statement( sql)
		    
		  End If
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub UPDATE_Plan_Types()
		  
		  
		  // Create Plan Types Table
		  Var sql As String = "CREATE TABLE IF NOT EXISTS physics_tasking.plan_types (" _
		  +"plan_type_id INT AUTO_INCREMENT, " _
		  +"name VARCHAR(100) NOT NULL, " _
		  +"weight FLOAT NOT NULL DEFAULT 1.0, " _
		  +"site_id INT NOT NULL, " _
		  +"PRIMARY KEY (plan_type_id), " _
		  +"FOREIGN KEY (site_id) REFERENCES sites(site_id) " _
		  +"ON UPDATE NO ACTION ON DELETE NO ACTION);"
		  
		  Physics_Tasking.EXECUTE_Statement( sql)
		  
		  
		  // Add no_of_plans column
		  
		  sql = "SHOW COLUMNS FROM physics_tasking.plan_types "  _
		  + "LIKE 'no_of_plans';"
		  Var rs As RowSet= Physics_Tasking.SELECT_Statement( sql)
		  
		  If rs.RowCount = 0 Then
		    
		    sql = "ALTER TABLE physics_tasking.plan_types " _
		    + "ADD COLUMN no_of_plans INTEGER NOT NULL DEFAULT 1;"
		    Physics_Tasking.EXECUTE_Statement( sql)
		    
		  End If
		  
		  
		  
		  
		  //Add indexes
		  
		  sql = "SELECT COUNT(1) IndexIsThere FROM INFORMATION_SCHEMA.STATISTICS " _
		  + "WHERE table_schema='physics_tasking' AND table_name='plan_types' AND index_name='idx_plan_type_name_and_site_id';"
		  
		  rs = Physics_Tasking.SELECT_Statement( sql)
		  
		  If rs.Column( "IndexIsThere").IntegerValue = 0 Then
		    
		    sql = "CREATE INDEX idx_plan_type_name_and_site_id " _
		    + "ON physics_tasking.plan_types (site_id, name);"
		    
		    Physics_Tasking.EXECUTE_Statement( sql)
		    
		    
		    
		    
		  End If
		  
		  
		  sql = "SELECT COUNT(1) IndexIsThere FROM INFORMATION_SCHEMA.STATISTICS " _
		  + "WHERE table_schema='physics_tasking' AND table_name='plan_types' AND index_name='idx_plan_type_name';"
		  
		  rs = Physics_Tasking.SELECT_Statement( sql)
		  
		  If rs.Column( "IndexIsThere").IntegerValue = 0 Then
		    
		    sql = "CREATE INDEX idx_task_type_name " _
		    + "ON physics_tasking.plan_types ( name);"
		    
		    Physics_Tasking.EXECUTE_Statement( sql)
		    
		    
		  End If
		  
		  
		  sql = "SELECT COUNT(1) IndexIsThere FROM INFORMATION_SCHEMA.STATISTICS " _
		  + "WHERE table_schema='physics_tasking' AND table_name='plan_types' AND index_name='idx_site_id';"
		  
		  rs = Physics_Tasking.SELECT_Statement( sql)
		  
		  If rs.Column( "IndexIsThere").IntegerValue = 0 Then
		    
		    sql = "CREATE INDEX idx_site_id " _
		    + "ON physics_tasking.plan_types ( site_id);"
		    
		    Physics_Tasking.EXECUTE_Statement( sql)
		    
		    
		  End If
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub UPDATE_Scheduled_Tasks()
		  
		  // Create Plan Table
		  Var sql As String = "CREATE TABLE IF NOT EXISTS physics_tasking.scheduled_tasks (" _
		  + "scheduled_task_id INT AUTO_INCREMENT, " _
		  + "task_type_id INT NOT NULL, " _
		  + "machine_id INT NOT NULL, " _
		  + "user_id INT NOT NULL, " _
		  + "assignment_date DATETIME NOT NULL, "_
		  + "assigned_by_id INT NOT NULL, " _
		  + "due_date DATE NOT NULL, " _
		  + "is_completed BOOLEAN NOT NULL DEFAULT FALSE, " _
		  + "completion_date DATETIME, " _
		  + "multiplier INT NOT NULL DEFAULT 1, " _
		  + "notes TEXT, "_
		  + "PRIMARY KEY (scheduled_task_id), " _
		  + "FOREIGN KEY (task_type_id) REFERENCES task_types(task_type_id) " _
		  + "ON UPDATE NO ACTION ON DELETE NO ACTION, " _
		  + "FOREIGN KEY (machine_id) REFERENCES machines(machine_id) " _
		  + "ON UPDATE NO ACTION ON DELETE NO ACTION, " _
		  + "FOREIGN KEY (user_id) REFERENCES users(user_id) " _
		  + "ON UPDATE NO ACTION ON DELETE NO ACTION);"
		  
		  
		  Physics_Tasking.EXECUTE_Statement( sql)
		  
		  
		  
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub UPDATE_Sites()
		  
		  
		  // Create Sites Table
		  Var sql As String = "CREATE TABLE IF NOT EXISTS physics_tasking.sites (" _
		  +"site_id INT AUTO_INCREMENT, " _
		  +"name VARCHAR(50) NOT NULL UNIQUE, " _
		  +"is_uppercase BOOLEAN DEFAULT False, " _
		  +"PRIMARY KEY (site_id));"
		  
		  Physics_Tasking.EXECUTE_Statement( sql)
		  
		  
		  sql = "INSERT INTO physics_tasking.sites (name) " _
		  +"SELECT * FROM (SELECT 'Brain') AS tmp " _
		  +"WHERE NOT EXISTS (SELECT name FROM physics_tasking.sites " _
		  +"WHERE name = 'Brain') LIMIT 1"
		  
		  Physics_Tasking.EXECUTE_Statement( sql)
		  
		  
		  
		  
		  
		  //Add indexes
		  
		  sql = "SELECT COUNT(1) IndexIsThere FROM INFORMATION_SCHEMA.STATISTICS " _
		  + "WHERE table_schema='physics_tasking' AND table_name='sites' AND index_name='idx_site_name';"
		  
		  Var rs As RowSet = Physics_Tasking.SELECT_Statement( sql)
		  
		  If rs.Column( "IndexIsThere").IntegerValue = 0 Then
		    
		    sql = "CREATE INDEX idx_site_name " _
		    + "ON physics_tasking.sites (name);"
		    
		    Physics_Tasking.EXECUTE_Statement( sql)
		    
		    
		    
		    
		  End If
		  
		  
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub UPDATE_Tasks()
		  
		  // Create Plan Table
		  Var sql As String = "CREATE TABLE IF NOT EXISTS physics_tasking.tasks (" _
		  +"task_id INT AUTO_INCREMENT, " _
		  +"task_type_id INT NOT NULL, " _
		  +"user_id INT NOT NULL, " _
		  +"completion_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP, " _
		  +"multiplier INT NOT NULL DEFAULT 1, " _
		  +"notes TEXT, "_
		  +"link_id INT, "_
		  +"PRIMARY KEY (task_id), " _
		  +"FOREIGN KEY (task_type_id) REFERENCES task_types(task_type_id) " _
		  +"ON UPDATE NO ACTION ON DELETE NO ACTION, " _
		  +"FOREIGN KEY (user_id) REFERENCES users(user_id) " _
		  +"ON UPDATE NO ACTION ON DELETE NO ACTION);"
		  
		  
		  Physics_Tasking.EXECUTE_Statement( sql)
		  
		  
		  
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub UPDATE_Task_Groups()
		  
		  // Create Task Groups Table
		  Var sql As String = "CREATE TABLE IF NOT EXISTS physics_tasking.task_groups (" _
		  +"task_group_id INT AUTO_INCREMENT, " _
		  +"name VARCHAR(50) NOT NULL UNIQUE, " _
		  +"PRIMARY KEY (task_group_id));"
		  
		  Physics_Tasking.EXECUTE_Statement( sql)
		  
		  sql = "INSERT INTO physics_tasking.task_groups (name) " _
		  +"SELECT * FROM (SELECT 'Administration') AS tmp " _
		  +"WHERE NOT EXISTS (SELECT name FROM physics_tasking.task_groups " _
		  +"WHERE name = 'Administration') LIMIT 1"
		  
		  Physics_Tasking.EXECUTE_Statement( sql)
		  
		  
		  
		  
		  
		  
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub UPDATE_Task_Types()
		  
		  // Create Task Types Table
		  Var sql As String = "CREATE TABLE IF NOT EXISTS physics_tasking.task_types (" _
		  +"task_type_id INT AUTO_INCREMENT, " _
		  +"name VARCHAR(100) NOT NULL, " _
		  +"task_group_id INT NOT NULL, " _
		  +"weight FLOAT NOT NULL DEFAULT 1.0, " _
		  +"has_multiplier BOOLEAN DEFAULT FALSE, " _
		  +"instructions TEXT, " _
		  +"PRIMARY KEY (task_type_id), " _
		  +"FOREIGN KEY (task_group_id) REFERENCES task_groups(task_group_id) " _
		  +"ON UPDATE NO ACTION ON DELETE NO ACTION);"
		  
		  Physics_Tasking.EXECUTE_Statement( sql)
		  
		  // Add retired column
		  
		  sql = "SHOW COLUMNS FROM physics_tasking.task_types LIKE 'is_schedulable';"
		  Var rs As RowSet= Physics_Tasking.SELECT_Statement( sql)
		  
		  If rs.RowCount = 0 Then
		    
		    sql = "ALTER TABLE physics_tasking.task_types " _
		    + "ADD COLUMN is_schedulable BOOLEAN NOT NULL DEFAULT FALSE;"
		    Physics_Tasking.EXECUTE_Statement( sql)
		    
		  End If
		  
		  
		  sql = "SELECT * FROM physics_tasking.task_types WHERE task_type_id = 1;"
		  
		  rs = Physics_Tasking.SELECT_Statement( sql)
		  
		  If rs.Column("task_type_id").Value = Nil Then
		    
		    
		    sql = "INSERT INTO physics_tasking.task_types (name, task_group_id, weight, has_multiplier, instructions) " _
		    + "VALUES ('Assign task/plan', 1, 0.08, TRUE, 'Assigning a plan or task. ***Countable [number of plans and tasks]')"
		    Physics_Tasking.EXECUTE_Statement( sql)
		    
		    
		  End If
		  //Add indexes
		  
		  sql = "SELECT COUNT(1) IndexIsThere FROM INFORMATION_SCHEMA.STATISTICS " _
		  + "WHERE table_schema='physics_tasking' AND table_name='task_types' AND index_name='idx_task_type_name_and_group_id';"
		  
		  rs = Physics_Tasking.SELECT_Statement( sql)
		  
		  If rs.Column( "IndexIsThere").IntegerValue = 0 Then
		    
		    sql = "CREATE INDEX idx_task_type_name_and_group_id " _
		    + "ON physics_tasking.task_types (task_group_id, name);"
		    
		    Physics_Tasking.EXECUTE_Statement( sql)
		    
		    
		    
		    
		  End If
		  
		  
		  sql = "SELECT COUNT(1) IndexIsThere FROM INFORMATION_SCHEMA.STATISTICS " _
		  + "WHERE table_schema='physics_tasking' AND table_name='task_types' AND index_name='idx_task_type_name';"
		  
		  rs = Physics_Tasking.SELECT_Statement( sql)
		  
		  If rs.Column( "IndexIsThere").IntegerValue = 0 Then
		    
		    sql = "CREATE INDEX idx_task_type_name " _
		    + "ON physics_tasking.task_types ( name);"
		    
		    Physics_Tasking.EXECUTE_Statement( sql)
		    
		    
		  End If
		  
		  
		  sql = "SELECT COUNT(1) IndexIsThere FROM INFORMATION_SCHEMA.STATISTICS " _
		  + "WHERE table_schema='physics_tasking' AND table_name='task_types' AND index_name='idx_task_group_id';"
		  
		  rs = Physics_Tasking.SELECT_Statement( sql)
		  
		  If rs.Column( "IndexIsThere").IntegerValue = 0 Then
		    
		    sql = "CREATE INDEX idx_task_group_id " _
		    + "ON physics_tasking.task_types ( task_group_id);"
		    
		    Physics_Tasking.EXECUTE_Statement( sql)
		    
		    
		  End If
		  
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub UPDATE_TimeBack()
		  
		  
		  // Create OverTime Table
		  Var sql As String = "CREATE TABLE IF NOT EXISTS physics_tasking.timeback (" _
		  + "timeback_id INT AUTO_INCREMENT, " _
		  + "notes VARCHAR(500) NOT NULL, " _
		  + "hours FLOAT NOT NULL DEFAULT 0.0, " _
		  + "user_id INT NOT NULL, " _
		  + "PRIMARY KEY (timeback_id), " _
		  + "FOREIGN KEY (user_id) REFERENCES users(user_id));"
		  
		  Physics_Tasking.EXECUTE_Statement( sql)
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub UPDATE_TimeLogs()
		  
		  
		  // Create Timelogs Table
		  Var sql As String = "CREATE TABLE IF NOT EXISTS physics_tasking.timelogs (" _
		  +"timelog_id INT AUTO_INCREMENT, " _
		  +"time_in DATETIME NOT NULL, " _
		  +"time_out DATETIME , " _
		  +"notes VARCHAR(500), " _
		  +"user_id INT NOT NULL, " _
		  +"PRIMARY KEY (timelog_id), " _
		  +"FOREIGN KEY (user_id) REFERENCES users(user_id));"
		  
		  Physics_Tasking.EXECUTE_Statement( sql)
		  
		  
		  // Add add_subtract column
		  
		  sql = "SHOW COLUMNS FROM physics_tasking.timelogs "  _
		  + "LIKE 'add_subtract';"
		  Var rs As RowSet= Physics_Tasking.SELECT_Statement( sql)
		  
		  If rs.RowCount = 0 Then
		    
		    sql = "ALTER TABLE physics_tasking.timelogs " _
		    + "ADD COLUMN add_subtract DOUBLE NOT NULL DEFAULT 0;"
		    Physics_Tasking.EXECUTE_Statement( sql)
		    
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub UPDATE_Users()
		  
		  
		  // Create Users Table
		  Var sql As String = "CREATE TABLE IF NOT EXISTS physics_tasking.users (" _
		  +"user_id INTEGER AUTO_INCREMENT, " _
		  +"first_name VARCHAR(50) NOT NULL, " _
		  +"family_name VARCHAR(50) NOT NULL, " _
		  +"hospital_id VARCHAR(10) NOT NULL UNIQUE, " _
		  +"initials VARCHAR(5) NOT NULL UNIQUE, " _
		  +"login VARCHAR(50) NOT NULL UNIQUE, " _
		  +"email VARCHAR(100) NOT NULL, " _
		  +"mobile VARCHAR(20), " _
		  +"extension VARCHAR(10), " _
		  +"password BLOB NOT NULL, " _
		  +"category_id INTEGER NOT NULL, " _
		  +"is_active BOOLEAN NOT NULL DEFAULT TRUE, " _
		  +"reset_password BOOLEAN NOT NULL DEFAULT FALSE, " _
		  +"is_retired BOOLEAN NOT NULL DEFAULT FALSE, " _
		  +"PRIMARY KEY (user_id), " _
		  +"FOREIGN KEY (category_id) REFERENCES categories(category_id) " _
		  +"ON UPDATE NO ACTION ON DELETE NO ACTION);"
		  
		  Physics_Tasking.EXECUTE_Statement( sql)
		  
		  // Add retired column
		  
		  sql = "SHOW COLUMNS FROM physics_tasking.users LIKE 'is_retired';"
		  Var rs As RowSet= Physics_Tasking.SELECT_Statement( sql)
		  
		  If rs.RowCount = 0 Then
		    
		    sql = "ALTER TABLE physics_tasking.users " _
		    + "ADD COLUMN is_retired BOOLEAN NOT NULL DEFAULT FALSE;"
		    Physics_Tasking.EXECUTE_Statement( sql)
		    
		  End If
		  
		  
		  // Add Admin User
		  
		  sql = "SELECT * FROM physics_tasking.users WHERE " _
		  +"login = 'admin'"
		  
		  rs = Physics_Tasking.SELECT_Statement( sql)
		  
		  
		  If rs.RowCount = 0 Then
		    
		    
		    Var row As New DatabaseRow
		    
		    row.Column("first_name").StringValue = "admin"
		    row.Column("family_name").StringValue = "admin"
		    row.Column("login").StringValue = "admin"
		    row.Column("initials").StringValue = "admin"
		    row.Column("hospital_id").StringValue = "admin"
		    row.Column("email").StringValue = "admin@myemail.com"
		    row.Column("password").BlobValue = _
		    Crypto.Hash("password", Crypto.Algorithm.SHA512)
		    row.Column("category_id").IntegerValue = 1
		    row.Column("is_active").BooleanValue = True
		    row.Column("reset_password").BooleanValue = False
		    
		    
		    Physics_Tasking.INSERT_Row( "physics_tasking.users", row)
		    
		  End If
		  
		  
		  
		  //ADD Index
		  
		  
		  //sorting users_initials
		  
		  
		  sql = "SELECT COUNT(1) IndexIsThere FROM INFORMATION_SCHEMA.STATISTICS " _
		  + "WHERE table_schema='physics_tasking' AND table_name='users' AND index_name='idx_user_initials';"
		  
		  rs = Physics_Tasking.SELECT_Statement( sql)
		  
		  If rs.Column( "IndexIsThere").IntegerValue = 0 Then
		    
		    sql = "CREATE INDEX idx_user_initials " _
		    + "ON physics_tasking.users (initials);"
		    
		    Physics_Tasking.EXECUTE_Statement( sql)
		    
		    
		    
		    
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub UPDATE_Vacations()
		  // Create General Information table
		  
		  
		  Var sql As String = "CREATE TABLE IF NOT EXISTS physics_tasking.vacations (" _
		  +"vacation_date DATE NOT NULL, " _
		  +"users_list VARCHAR(100) NOT NULL, "_
		  +"PRIMARY KEY (vacation_date));"
		  
		  Physics_Tasking.EXECUTE_Statement( sql)
		  
		  
		  
		  
		  
		End Sub
	#tag EndMethod


	#tag Note, Name = Create User and Database
		
		DROP USER IF EXISTS 'physics_tasking_user'@'%';
		DROP USER IF EXISTS 'physics_tasking_user'@'localhost';
		DROP DATABASE IF EXISTS physics_tasking;
		CREATE DATABASE physics_tasking;   
		CREATE USER 'physics_tasking_user'@'%' IDENTIFIED WITH mysql_native_password BY 'physics_tasking_user';
		GRANT ALL ON physics_tasking.* TO 'physics_tasking_user'@'%';
		DROP USER IF EXISTS 'physics_tasking_user'@'localhost';
		CREATE USER 'physics_tasking_user'@'localhost' IDENTIFIED WITH mysql_native_password BY 'physics_tasking_user';
		GRANT ALL ON physics_tasking.* TO 'physics_tasking_user'@'localhost';
		FLUSH PRIVILEGES;
		
		DROP USER IF EXISTS 'wabdel'@'%';
		CREATE USER 'wabdel'@'%' IDENTIFIED WITH mysql_native_password BY 'ps151973';
		GRANT ALL ON *.* TO 'wabdel'@'%';
		DROP USER IF EXISTS 'wabdel'@'localhost';
		CREATE USER 'wabdel'@'localhost' IDENTIFIED WITH mysql_native_password BY 'ps151973';
		GRANT ALL ON *.* TO 'wabdel'@'localhost';
		FLUSH PRIVILEGES;
	#tag EndNote


	#tag Property, Flags = &h0
		db_host As String = "127.0.0.1"
	#tag EndProperty

	#tag Property, Flags = &h0
		db_name As String = "physics_tasking"
	#tag EndProperty

	#tag Property, Flags = &h0
		db_password As String = "physics_tasking_user"
	#tag EndProperty

	#tag Property, Flags = &h0
		db_port As integer = 3306
	#tag EndProperty

	#tag Property, Flags = &h0
		db_username As String = "physics_tasking_user"
	#tag EndProperty

	#tag Property, Flags = &h0
		Groups() As Physics_Tasking.CLASS_Group_Record
	#tag EndProperty

	#tag Property, Flags = &h0
		Half_life_In_Days As Integer = 14
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  misDatabase_Online = False
			  
			  
			  
			  Var db As New MySQLCommunityServer
			  db.Host = Physics_Tasking.db_host
			  db.Port = Physics_Tasking.db_port
			  db.DatabaseName = Physics_Tasking.db_name
			  db.UserName = Physics_Tasking.db_username
			  db.Password = Physics_Tasking.db_password
			  
			  If db.Connect Then misDatabase_Online = True
			  
			  db.Close
			  
			  Return misDatabase_Online
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  misDatabase_Online = value
			End Set
		#tag EndSetter
		isDatabase_Online As Boolean
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private misDatabase_Online As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		Points_period_days As Integer = 30
	#tag EndProperty

	#tag Property, Flags = &h0
		Population_period_days As Integer = 14
	#tag EndProperty

	#tag Property, Flags = &h0
		Users() As Physics_Tasking.CLASS_User_Record
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Points_period_days"
			Visible=false
			Group="Behavior"
			InitialValue="90"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Half_life_In_Days"
			Visible=false
			Group="Behavior"
			InitialValue="14"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Population_period_days"
			Visible=false
			Group="Behavior"
			InitialValue="14"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="isDatabase_Online"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="db_host"
			Visible=false
			Group="Behavior"
			InitialValue="127.0.0.1"
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="db_name"
			Visible=false
			Group="Behavior"
			InitialValue="physics_tasking"
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="db_password"
			Visible=false
			Group="Behavior"
			InitialValue="physics_tasking_user"
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="db_port"
			Visible=false
			Group="Behavior"
			InitialValue="3306"
			Type="integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="db_username"
			Visible=false
			Group="Behavior"
			InitialValue="physics_tasking_user"
			Type="String"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Module
#tag EndModule
