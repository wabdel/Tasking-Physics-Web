#tag Class
Protected Class CLASS_User_Record
	#tag Method, Flags = &h0
		Sub Constructor()
		  Group = New Physics_Tasking.CLASS_Group_Record
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GET_Accumulated_Assigned_Task_Points(d as Datetime) As Double
		  Var Set_Date As New DateTime( d.Year, d.Month, d.day)
		  
		  Var sql As String = "SELECT SUM( " _
		  + App.Points_Schedulted_Tasks_Condition + " * multiplier) as sum " _
		  + "FROM scheduled_tasks INNER JOIN task_types USING(task_type_id) " _
		  + "WHERE user_id = " + id.ToString + " "_
		  + "AND is_completed = TRUE " _
		  + "AND datediff( '"  + Set_Date.SQLDate + "' , DATE(completion_date)) >= 0 " _
		  + "AND datediff( '"  + Set_Date.SQLDate + "' , DATE(completion_date)) <= 365;"
		  
		  Var rs As RowSet = Physics_Tasking.DB_SELECT_Statement( sql)
		  
		  If rs.RowCount = 1 Then Return rs.Column("sum").DoubleValue
		  
		  Return 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GET_Accumulated_Plan_Points(d as Datetime) As Double
		  Var Set_Date As New DateTime( d.Year, d.Month, d.day)
		  
		  Var sql As String = "SELECT SUM(" _
		  + App.Points_Plans_Condition + ") " _
		  + "AS sum " _
		  + "FROM plans INNER JOIN plan_types on plans.plan_type_id = plan_types.plan_type_id " _
		  + "WHERE user_id = " + id.ToString + " " _
		  + "AND datediff( '"  + Set_Date.SQLDate + "' , DATE(assignment_date)) >= 0 " _
		  + "AND datediff( '"  + Set_Date.SQLDate + "' , DATE(assignment_date)) <= 365;"
		  
		  Var rs As RowSet = Physics_Tasking.DB_SELECT_Statement( sql)
		  
		  
		  If rs.RowCount = 1 Then Return rs.Column("sum").DoubleValue
		  
		  Return 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GET_Accumulated_Points(d as DateTime) As Double
		  
		  
		  Return GET_Accumulated_Plan_Points(d) + GET_Accumulated_Task_Points(d) + GET_Accumulated_Assigned_Task_Points(d)
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GET_Accumulated_Task_Points(d as Datetime) As Double
		  Var Set_Date As New DateTime( d.Year, d.Month, d.day)
		  
		  Var sql As String = "SELECT SUM( " _
		  + "weight * multiplier) as sum " _
		  + "FROM tasks INNER JOIN task_types USING(task_type_id) " _
		  + "WHERE user_id = " + id.ToString + " "_
		  + "AND datediff( '"  + Set_Date.SQLDate + "' , DATE(completion_date)) >= 0 " _
		  + "AND datediff( '"  + Set_Date.SQLDate + "' , DATE(completion_date)) <= 365;"
		  
		  Var rs As RowSet = Physics_Tasking.DB_SELECT_Statement( sql)
		  
		  While rs = Nil
		    
		    rs = Physics_Tasking.DB_SELECT_Statement( sql)
		    
		    
		  Wend
		  If rs.RowCount = 1 Then Return rs.Column("sum").DoubleValue
		  
		  Return 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GET_Completed_Plans_Count(d_max as DateTime, d_min as DateTime) As Integer
		  
		  Var sql As String  = "SELECT COUNT(*) " _
		  + "FROM plans WHERE " _
		  + "DATE(assignment_date) >= '" + d_min.SQLDate + "' AND " _
		  + "DATE(assignment_date) <= '" + d_max.SQLDate + "'"
		  
		  Var rs As RowSet = Physics_Tasking.DB_SELECT_Statement(sql)
		  
		  Return rs.Column("COUNT(*)").IntegerValue
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GET_Completed_Tasks_Count(d_max as DateTime, d_min as DateTime) As Integer
		  
		  Var sql As String  = "SELECT COUNT(*) " _
		  + "FROM tasks WHERE " _
		  + "DATE(completion_date) >= '" + d_min.SQLDate + "' AND " _
		  + "DATE(completion_date) <= '" + d_max.SQLDate + "'"
		  
		  Var rs As RowSet = Physics_Tasking.DB_SELECT_Statement( sql)
		  
		  Return rs.Column("COUNT(*)").IntegerValue
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GET_Count_and_Points_for_plan_type(plan_type_id as Integer, d_initial as DateTime, d_final as Datetime) As Rowset
		  
		  Var sql As String = "SELECT COUNT(*), SUM( CASE " _
		  + "WHEN DATEDIFF(DATE(due_date), DATE(assignment_date)) <= 0 THEN " _
		  + "weight * 2 " _
		  + "WHEN DATEDIFF(DATE(due_date), DATE(assignment_date)) <= 1 THEN " _
		  + "weight * 1.5 " _
		  + "WHEN DATEDIFF(DATE(due_date), DATE(assignment_date)) <= 2 THEN " _
		  + "weight * 1.25 " _
		  + "ELSE " _
		  + "weight " _
		  + "END) " _
		  + "AS sum " _
		  + "FROM physics_tasking.plans " _
		  + "INNER JOIN physics_tasking.plan_types USING (plan_type_id) " _
		  + "INNER JOIN  physics_tasking.sites USING (site_id) " _
		  + "WHERE physics_tasking.plan_types.plan_type_id = " + plan_type_id.ToString +" AND " _
		  + "physics_tasking.plans.user_id = " + id.ToString +" AND " _
		  + "assignment_date BETWEEN '" + d_initial.SQLDate + "' AND '" + d_final.SQLDate + "';"
		  
		  Return Physics_Tasking.DB_SELECT_Statement( sql)
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GET_Count_and_Points_for_site(site_id as Integer, d_initial as DateTime, d_final as Datetime) As Rowset
		  
		  Var sql As String = "SELECT COUNT(*), SUM( " _
		  + "CASE WHEN 5 * (DATEDIFF(DATE(due_date), DATE(assignment_date)) DIV 7) + " _
		  + "MID('0123334401222334011122340001123400012344001234440', 7 * " _
		  + "WEEKDAY(DATE(assignment_date)) + WEEKDAY(DATE(due_date)) + 1, 1) <= 0 THEN " _
		  + "weight * 2 " _
		  + "WHEN 5 * (DATEDIFF(DATE(due_date), DATE(assignment_date)) DIV 7) + " _
		  + "MID('0123334401222334011122340001123400012344001234440', 7 * WEEKDAY(DATE(assignment_date)) + " _
		  + "WEEKDAY(DATE(due_date)) + 1, 1) <= 1 THEN " _
		  + "weight * 1.5 " _
		  + "WHEN 5 * (DATEDIFF(DATE(due_date), DATE(assignment_date)) DIV 7) + " _
		  + "MID('0123334401222334011122340001123400012344001234440', 7 * WEEKDAY(DATE(assignment_date)) + " _
		  + "WEEKDAY(DATE(due_date)) + 1, 1) <= 2 THEN " _
		  + "weight * 1.25 " _
		  + "ELSE " _
		  + "weight " _
		  +" END) " _
		  + "AS sum " _
		  + "FROM physics_tasking.plans " _
		  + "INNER JOIN physics_tasking.plan_types USING (plan_type_id) " _
		  + "INNER JOIN  physics_tasking.sites USING (site_id) " _
		  + "WHERE physics_tasking.sites.site_id = " + site_id.ToString +" AND " _
		  + "physics_tasking.plans.user_id = " + id.ToString +" AND " _
		  + " assignment_date BETWEEN '" + d_initial.SQLDate + "' AND '" + d_final.SQLDate + "';"
		  
		  Return Physics_Tasking.DB_SELECT_Statement( sql)
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GET_Recent_Assigned_Tasks_Points(d as DateTime) As double
		  
		  Var Set_date As New DateTime(d.Year, d.Month, d.Day)
		  
		  Var sql As String = "SELECT SUM( " _
		  + App.Points_Schedulted_Tasks_Condition + " * multiplier) as sum " _
		  + "FROM scheduled_tasks INNER JOIN task_types USING(task_type_id) " _
		  + "WHERE user_id = " + id.ToString + " "_
		  + "AND is_completed = TRUE " _
		  + "AND datediff('" + Set_date.SQLDate + "', DATE(completion_date)) <= " + Physics_Tasking.Points_period_days.ToString + " " _
		  + "AND datediff('" + Set_date.SQLDate + "', DATE(completion_date)) >= 0;"
		  
		  Var rs As RowSet = Physics_Tasking.DB_SELECT_Statement(sql)
		  
		  If rs.RowCount = 1 Then Return rs.Column("sum").DoubleValue
		  
		  Return 0
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GET_Recent_Plan_Points(d as DateTime) As double
		  Var Set_Date As New DateTime( d.Year, d.Month, d.day)
		  Var sql As String = "SELECT SUM( " _
		  + "If( " _
		  + "5 * (DATEDIFF(DATE('" +Set_Date.SQLDate+"'), DATE(due_date)) DIV 7) + " _
		  + "MID('0123334401222334011122340001123400012344001234440', 7 * WEEKDAY(DATE(due_date)) + " _
		  + "WEEKDAY(DATE('" +Set_Date.SQLDate+"')) + 1, 1) > 0, " _
		  + "Exp(-ln(2)*DATEDIFF('" +Set_Date.SQLDate+"', DATE(due_date))/" + Physics_Tasking.Half_life_In_Days.ToString +"), " _
		  + " 1) " _
		  + "* " _
		  + App.Points_Plans_Condition + ") " _
		  + "AS sum " _
		  + "FROM plans INNER JOIN plan_types USING(plan_type_id) " _
		  + "WHERE user_id = " + id.ToString + " " _
		  + "AND (datediff('" + Set_Date.SQLDate +"', DATE(assignment_date)) <= " + Physics_Tasking.Points_period_days.ToString + " " _
		  + "AND datediff('" + Set_Date.SQLDate + "', DATE(assignment_date)) >= 0) ;"
		  
		  
		  Var rs As RowSet = Physics_Tasking.DB_SELECT_Statement( sql)
		  
		  If rs.RowCount = 1 Then Return rs.Column("sum").DoubleValue
		  
		  Return 0
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GET_Recent_Plan_Points1(d as DateTime) As double
		  Var Set_Date As New DateTime( d.Year, d.Month, d.day)
		  Var sql As String = "SELECT SUM( " _
		  + "If( " _
		  + "datediff('" +Set_Date.SQLDate+"', due_date) > 0, " _
		  + "Exp(-ln(2)*DATEDIFF('" +Set_Date.SQLDate+"', due_date)/" + Physics_Tasking.Half_life_In_Days.ToString +"), " _
		  + " 1) " _
		  + "* " _
		  + "CASE " _
		  + "WHEN datediff(due_date, assignment_date) <= 0 Then " _
		  + "weight*2 " _
		  + "WHEN datediff(due_date, assignment_date) <= 1 Then " _
		  + "weight*1.5 " _
		  + "WHEN datediff(due_date, assignment_date) <= 2 Then " _
		  + "weight*1.25 " _
		  + "ELSE " _
		  + "weight " _
		  + "END) " _
		  + "AS sum " _
		  + "FROM plans INNER JOIN plan_types USING(plan_type_id) " _
		  + "WHERE user_id = " + id.ToString + " " _
		  + "AND ((datediff('" + Set_Date.SQLDate +"', assignment_date) <= " + Physics_Tasking.Points_period_days.ToString + " " _
		  + "AND datediff('" + Set_Date.SQLDate + "', assignment_date) >= 0) " _
		  + "OR plans.is_completed = false);"
		  
		  
		  Var rs As RowSet = Physics_Tasking.DB_SELECT_Statement( sql)
		  
		  If rs.RowCount = 1 Then Return rs.Column("sum").DoubleValue
		  
		  Return 0
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GET_Recent_Points(d as DateTime) As Double
		  
		  
		  Return GET_Recent_Plan_Points(d) + GET_Recent_Tasks_Points(d) + GET_Recent_Assigned_Tasks_Points(d)
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GET_Recent_Tasks_Points(d as DateTime) As double
		  
		  Var Set_date As New DateTime(d.Year, d.Month, d.Day)
		  
		  Var sql As String = "SELECT SUM( " _
		  + "weight * multiplier * exp(-ln(2)*DATEDIFF('" + Set_date.SQLDate + "', DATE(completion_date))/" + Physics_Tasking.Half_life_In_Days.ToString + ")) as sum " _
		  + "FROM tasks INNER JOIN task_types USING(task_type_id) " _
		  + "WHERE user_id = " + id.ToString _
		  + " AND datediff('" + Set_date.SQLDate + "', DATE(completion_date)) <= " + Physics_Tasking.Points_period_days.ToString _
		  + " AND datediff('" + Set_date.SQLDate + "', DATE(completion_date)) >= 0;"
		  
		  Var rs As RowSet = Physics_Tasking.DB_SELECT_Statement(sql)
		  
		  If rs.RowCount = 1 Then Return rs.Column("sum").DoubleValue
		  
		  Return 0
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GET_Total_Plan_Points(d as DateTime) As Double
		  Return points_fraction * GET_Recent_Plan_Points( d) + _
		  (1 - points_fraction) * GET_Accumulated_Plan_Points( d)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GET_Total_Points(d as DateTime) As Double
		  
		  Return 0.9 * GET_Recent_Points( d) + 0.1 * GET_Accumulated_Points( d)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GET_Total_Task_Points(d as DateTime) As Double
		  Return points_fraction * GET_Recent_Tasks_Points( d) + _
		  (1 - points_fraction) * GET_Accumulated_Task_Points( d) + _
		  points_fraction * GET_Recent_Assigned_Tasks_Points( d) + _
		  (1 - points_fraction) * GET_Accumulated_Assigned_Task_Points( d)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Return_Plans_Month_Year(month as Integer, year as integer) As Integer
		  
		  
		  Var sql As String = "SELECT COUNT(*) FROM physics_tasking.plans WHERE " _
		  + "YEAR(completion_date) = " + year.ToString + " AND " _
		  + "MONTH(completion_date) = " + month.ToString + " AND " _
		  + "user_id = " + id.ToString
		  
		  Var rs As RowSet = Physics_Tasking.DB_SELECT_Statement( sql)
		  
		  
		  Return rs.Column("COUNT(*)").IntegerValue
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Save()
		  Try
		    
		    
		    If id = 0 Then
		      
		      Var row As New DatabaseRow
		      
		      row.Column("login").StringValue = login.Trim.Lowercase
		      row.Column("first_name").StringValue = firstName.Trim.Titlecase
		      row.Column("family_name").StringValue = familyName.Trim.Uppercase
		      row.Column("initials").StringValue = initials.Trim.Lowercase
		      row.Column("hospital_id").StringValue = hospital_id.Trim.Lowercase
		      row.Column("email").StringValue = email.Trim
		      row.Column("mobile").StringValue = mobile.Trim
		      row.Column("extension").StringValue = extension.Trim
		      row.Column("category_id").IntegerValue = Group.id
		      row.Column("password").BlobValue = _
		      Crypto.Hash("12345678", Crypto.Algorithm.SHA512)
		      row.Column("is_active").BooleanValue = True
		      row.Column("reset_password").BooleanValue = True
		      row.Column("is_retired").BooleanValue = False
		      
		      db.AddRow("physics_tasking.users", row)
		      
		      
		      
		      Var sql As String = "SELECT user_id FROM physics_tasking.users " _
		      + "ORDER BY user_id DESC LIMIT 1;"
		      
		      If db.Connect Then
		        Var rs As RowSet = db.SelectSQL( sql)
		        Mid = rs.Column("user_id").IntegerValue
		        
		      End If
		      
		      Return
		      
		    Else
		      
		      
		      
		      If db.Connect Then
		        
		        Var ps As  PreparedSQLStatement = _
		        db.Prepare("UPDATE physics_tasking.users SET first_name = ?, " _
		        + "family_name = ?, " _
		        + "initials = ?, " _
		        + "email = ?, " _
		        + "category_id = ?, " _
		        + "hospital_id = ?, " _
		        + "mobile = ?," _
		        + "extension = ?," _
		        + "password = ?, " _
		        + "is_active = ?, " _
		        + "reset_password = ?, " _
		        + "is_retired = ? WHERE " _
		        + "user_id = ?")
		        
		        ps.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_STRING)
		        ps.BindType(1, MySQLPreparedStatement.MYSQL_TYPE_STRING)
		        ps.BindType(2, MySQLPreparedStatement.MYSQL_TYPE_STRING)
		        ps.BindType(3, MySQLPreparedStatement.MYSQL_TYPE_STRING)
		        ps.BindType(4, MySQLPreparedStatement.MYSQL_TYPE_LONG)
		        ps.BindType(5, MySQLPreparedStatement.MYSQL_TYPE_STRING)
		        ps.BindType(6, MySQLPreparedStatement.MYSQL_TYPE_STRING)
		        ps.BindType(7, MySQLPreparedStatement.MYSQL_TYPE_STRING)
		        ps.BindType(8, MySQLPreparedStatement.MYSQL_TYPE_BLOB)
		        ps.BindType(9, MySQLPreparedStatement.MYSQL_TYPE_LONG)
		        ps.BindType(10, MySQLPreparedStatement.MYSQL_TYPE_LONG)
		        ps.BindType(11, MySQLPreparedStatement.MYSQL_TYPE_LONG)
		        ps.BindType(12, MySQLPreparedStatement.MYSQL_TYPE_LONG)
		        
		        
		        
		        'If resetPassword Then _
		        'password = Crypto.Hash("12345678", Crypto.Algorithm.SHA512)
		        
		        ps.ExecuteSQL(firstName, _
		        familyName, _
		        initials, _
		        email, _
		        Group.id, _
		        hospital_id, _
		        mobile, _
		        extension, _
		        password, _
		        isActive, _
		        resetPassword, _
		        isRetired, _
		        id )
		        
		        
		        Return
		        
		        
		        
		      End If
		      
		    End If
		    
		  Catch de As DatabaseException
		    
		    Var theDialog As New MessageWebDialog
		    theDialog.Message_Label.Text = "Database error: (" + de.ErrorNumber.ToString + ") " + de.Message + "."
		    theDialog.Show
		    
		    
		  Catch noe As NilObjectException
		    
		    Var theDialog As New MessageWebDialog
		    theDialog.Message_Label.Text = "Database error: (" + noe.ErrorNumber.ToString + ") " + noe.Message + "."
		    theDialog.Show
		    
		  End Try
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		email As String
	#tag EndProperty

	#tag Property, Flags = &h0
		extension As String
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If App.ananomize Then
			    
			    Return ""
			    
			  Else
			    
			    Return mfamilyName
			    
			  End If
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  
			  mfamilyName = value
			End Set
		#tag EndSetter
		familyName As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If App.ananomize Then
			    
			    If Group.id = 2 Then
			      
			      Return "Physicist " + id.ToString
			      
			    ElseIf Group.id = 3 Then
			      
			      Return "Dosimetrist " + id.ToString
			      
			    Else
			      
			      Return mfirstName
			    End If
			    
			  Else
			    
			    Return mfirstName
			    
			  End If
			  
			  
			  
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mfirstName = value
			End Set
		#tag EndSetter
		firstName As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return firstName.Trim.Titlecase.Trim + " " + familyName.Trim.Uppercase.Trim
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mFull_Name = value
			End Set
		#tag EndSetter
		full_name As String
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		Group As Physics_Tasking.CLASS_Group_Record
	#tag EndProperty

	#tag Property, Flags = &h0
		hospital_id As String
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mid
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  
			  
			  Try
			    
			    If db.Connect Then
			      
			      Var sql As String = "SELECT * " _
			      +"FROM physics_tasking.users " _
			      +"WHERE user_id = "+Str(value)
			      Var rs As RowSet =db.SelectSQL( sql)
			      
			      If rs.RowCount = 1 Then
			        
			        Mid = value
			        firstName = rs.Column("first_name").StringValue
			        familyName = rs.Column("family_name").StringValue
			        hospital_id = rs.Column("hospital_id").StringValue
			        initials = rs.Column("initials").StringValue.Trim.Uppercase.Trim
			        Group = New CLASS_Group_Record
			        Group.id = rs.Column("category_id").IntegerValue
			        login = rs.Column("login").StringValue
			        password = rs.Column("password").StringValue
			        email = rs.Column("email").StringValue
			        mobile = rs.Column("mobile").StringValue
			        extension = rs.Column("extension").StringValue
			        resetPassword = rs.Column("reset_password").BooleanValue
			        isActive = rs.Column("is_active").BooleanValue
			        isRetired = rs.Column("is_retired").BooleanValue
			        
			        
			      End If
			      
			      
			    End If
			  Catch de As DatabaseException
			    
			    Var theDialog As New MessageWebDialog
			    theDialog.Message_Label.Text = "Database error: (" + de.ErrorNumber.ToString + ") " + de.Message + "."
			    theDialog.Show
			  Catch noe As NilObjectException
			    
			    Var theDialog As New MessageWebDialog
			    theDialog.Message_Label.Text = "Database error: (" + noe.ErrorNumber.ToString + ") " + noe.Message + "."
			    theDialog.Show
			    
			  End Try
			  
			  
			  
			End Set
		#tag EndSetter
		id As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If App.ananomize Then
			    
			    If Group.id = 2 Then
			      
			      Return "P" + id.ToString
			      
			    ElseIf Group.id = 3 Then
			      
			      Return "D" + id.ToString
			      
			    Else
			      
			      Return minitials
			    End If
			    
			  Else
			    
			    Return minitials
			    
			  End If
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  minitials = value
			End Set
		#tag EndSetter
		initials As string
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Var sql As String = "SELECT is_active " _
			  +"FROM physics_tasking.users " _
			  +"WHERE user_id = " + Mid.ToString
			  
			  Var rs As RowSet = Physics_Tasking.DB_SELECT_Statement(sql)
			  
			  misActive = rs.Column("is_active").BooleanValue
			  
			  Return misActive
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  misActive = value
			End Set
		#tag EndSetter
		isActive As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Var sql As String = "SELECT is_retired " _
			  +"FROM physics_tasking.users " _
			  +"WHERE user_id = " + Mid.ToString
			  
			  Var rs As RowSet = Physics_Tasking.DB_SELECT_Statement(sql)
			  
			  misRetired = rs.Column("is_retired").BooleanValue
			  
			  Return misRetired
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  misRetired = value
			End Set
		#tag EndSetter
		isRetired As Boolean
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		login As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mfamilyName As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mfirstName As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mFull_Name As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mid As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private minitials As string
	#tag EndProperty

	#tag Property, Flags = &h21
		Private misActive As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private misRetired As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mNo_of_Current_Assigned_Plans As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		mobile As String
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  Var sql As String = "SELECT COUNT(*) " _
			  + "FROM physics_tasking.plans " _
			  + "WHERE user_id = " + id.ToString + " " _
			  + "AND physics_tasking.plans.is_completed = false;"
			  
			  
			  Var rs As RowSet = Physics_Tasking.DB_SELECT_Statement( sql)
			  
			  If rs.RowCount = 1 Then
			    
			    mNo_of_Current_Assigned_Plans = rs.Column("COUNT(*)").IntegerValue
			    
			    
			  End If
			  
			  Return mNo_of_Current_Assigned_Plans
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mNo_of_Current_Assigned_Plans = value
			End Set
		#tag EndSetter
		No_of_Current_Assigned_Plans As Integer
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		password As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private points_fraction As Double = 0.9
	#tag EndProperty

	#tag Property, Flags = &h0
		resetPassword As Boolean
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
			Name="email"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="id"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="login"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="password"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="resetPassword"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="full_name"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="extension"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="mobile"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="hospital_id"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="familyName"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="firstName"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="initials"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="No_of_Current_Assigned_Plans"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="isActive"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="isRetired"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
