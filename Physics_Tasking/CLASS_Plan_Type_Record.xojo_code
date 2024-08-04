#tag Class
Protected Class CLASS_Plan_Type_Record
	#tag Method, Flags = &h0
		Sub Constructor()
		  Site_Record = New Physics_Tasking.CLASS_Site_Record
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GET_Count_and_Points(d_initial as DateTime, d_final as Datetime) As Rowset
		  
		  Var sql As String = "SELECT COUNT(*), SUM( CASE " _
		  + "WHEN DATEDIFF(due_date, assignment_date) <= 0 THEN " _
		  + "weight * 2 " _
		  + "WHEN DATEDIFF(due_date, assignment_date) <= 1 THEN " _
		  + "weight * 1.5 " _
		  + "WHEN DATEDIFF(due_date, assignment_date) <= 2 THEN " _
		  + "weight * 1.25 " _
		  + "ELSE " _
		  + "weight " _
		  + "END) " _
		  + "AS sum " _
		  + "FROM physics_tasking.plans " _
		  + "INNER JOIN physics_tasking.plan_types USING (plan_type_id) " _
		  + "INNER JOIN  physics_tasking.sites USING (site_id) " _
		  + "WHERE physics_tasking.plan_types.plan_type_id = " + id.ToString +" " _
		  + "AND assignment_date BETWEEN '" + d_initial.SQLDate + "' AND '" + d_final.SQLDate + "';"
		  
		  Return Physics_Tasking.SELECT_Statement( sql)
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Save()
		  
		  
		  
		  
		  If id = 0 Then
		    
		    
		    
		    Var row As New DatabaseRow
		    
		    row.Column("name").StringValue = name.Trim
		    row.Column("weight").DoubleValue = weight
		    row.Column("site_id").IntegerValue = Site_Record.id
		    
		    Physics_Tasking.INSERT_Row( "physics_tasking.plan_types", row)
		    
		    Var sql As String = "SELECT plan_type_id FROM physics_tasking.plan_types " _
		    + "ORDER BY plan_type_id LIMIT 1;"
		    
		    Var rs As RowSet = Physics_Tasking.SELECT_Statement( sql)
		    
		    Mid = rs.Column("plan_type_id").IntegerValue
		    
		  Else
		    
		    Var db As New MySQLCommunityServer
		    db.Host = Physics_Tasking.db_host
		    db.Port = Physics_Tasking.db_port
		    db.DatabaseName = Physics_Tasking.db_name
		    db.UserName = Physics_Tasking.db_username
		    db.Password = Physics_Tasking.db_password
		    
		    Try
		      
		      If db.Connect Then
		        
		        Var ps As  PreparedSQLStatement = _
		        db.Prepare("UPDATE physics_tasking.plan_types SET name = ?, " _
		        +"weight = ?, site_id = ? " _
		        +"WHERE plan_type_id = ?")
		        
		        ps.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_STRING)
		        ps.BindType(1, MySQLPreparedStatement.MYSQL_TYPE_FLOAT)
		        ps.BindType(2, MySQLPreparedStatement.MYSQL_TYPE_LONG)
		        ps.BindType(3, MySQLPreparedStatement.MYSQL_TYPE_LONG)
		        
		        
		        ps.ExecuteSQL(name.Trim, weight, Site_Record.id, id)
		        
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
		    
		    
		  End If
		  
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  
			  
			  Var sql As String = "SELECT COUNT(*) FROM physics_tasking.plans " _
			  + "WHERE physics_tasking.plans.plan_type_id = " + id.ToString + ";"
			  
			  
			  Var rs As RowSet = Physics_Tasking.SELECT_Statement( sql)
			  mcount = rs.Column("COUNT(*)").IntegerValue
			  
			  Return mcount
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mcount = value
			End Set
		#tag EndSetter
		count As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  'Var sql As String = "SELECT " _
			  '+ "datediff(physics_tasking.plans.due_date, physics_tasking.plans.assignment_date) As due_To_assign, " _
			  '+ "datediff(physics_tasking.plans.due_date, physics_tasking.plans.completion_date) As due_To_complete " _
			  '+ "FROM physics_tasking.plans INNER JOIN physics_tasking.plan_types " _
			  '+ "ON physics_tasking.plans.plan_type_id = physics_tasking.plan_types.plan_type_id " _
			  '+ "INNER JOIN physics_tasking.sites " _
			  '+ "ON physics_tasking.sites.site_id = physics_tasking.plan_types.site_id " _
			  '+ "WHERE physics_tasking.plans.completion_date Is Not NULL AND " _
			  '+ "physics_tasking.plan_types.plan_type_id = " + id.ToString + ";"
			  
			  
			  
			  
			  
			  VAR sql as String = " SELECT " _
			  + "5 * (DATEDIFF(physics_tasking.plans.due_date, physics_tasking.plans.assignment_date) DIV 7) + " _
			  + "Mid('0123334401222334011122340001123400012344001234440', 7 * WEEKDAY(physics_tasking.plans.assignment_date) + " _
			  + "WEEKDAY(physics_tasking.plans.due_date) + 1, 1) as due_to_assign, " _
			  + "5 * (DATEDIFF(physics_tasking.plans.due_date, physics_tasking.plans.completion_date) DIV 7) + " _
			  + "Mid('0123334401222334011122340001123400012344001234440', 7 * WEEKDAY(physics_tasking.plans.completion_date) + " _
			  + "WEEKDAY(physics_tasking.plans.due_date) + 1, 1) As due_To_complete " _
			  + "FROM physics_tasking.plans INNER JOIN physics_tasking.plan_types " _
			  + "ON physics_tasking.plans.plan_type_id = physics_tasking.plan_types.plan_type_id " _
			  + "INNER JOIN physics_tasking.sites " _
			  + "ON physics_tasking.sites.site_id = physics_tasking.plan_types.site_id " _
			  + "WHERE physics_tasking.plans.completion_date Is Not NULL AND " _
			  + "physics_tasking.plan_types.plan_type_id = " + id.ToString + ";"
			  
			  Var rs As RowSet = Physics_Tasking.SELECT_Statement( sql)
			  
			  Var sum As Double = 0
			  Var count As Integer = 0
			  
			  While Not rs.AfterLastRow
			    
			    If rs.Column("due_to_assign").IntegerValue > 1 Then
			      
			      count = count + 1
			      
			      If rs.Column("due_To_complete").IntegerValue > 0 Then
			        
			        sum = sum + rs.Column("due_To_complete").IntegerValue / rs.Column("due_To_assign").IntegerValue
			        
			      End If
			      
			    End If
			    
			    rs.MoveToNextRow
			    
			  Wend
			  
			  If count > 0 Then
			    
			    mefficiency = sum / count
			    
			  Else
			    
			    mefficiency = -1
			    
			  End If
			  
			  Return mefficiency
			  
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mefficiency = value
			End Set
		#tag EndSetter
		efficiency As Double
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mid
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  
			  Var sql As String = "SELECT plan_type_id, name, site_id, weight " _
			  +"FROM physics_tasking.plan_types " _
			  +"WHERE plan_type_id = " + value.ToString
			  
			  Var rs As RowSet = Physics_Tasking.SELECT_Statement( sql)
			  
			  If rs.RowCount = 1 Then
			    name = rs.Column("name").StringValue
			    weight = rs.Column("weight").DoubleValue
			    Site_Record.id = rs.Column("site_id").IntegerValue
			    
			    Mid = value
			    
			  End If
			  
			  
			End Set
		#tag EndSetter
		id As Integer
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		is_Uppercase As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mcount As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mefficiency As Double
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mid As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		name As String
	#tag EndProperty

	#tag Property, Flags = &h0
		Site_Record As Physics_Tasking.CLASS_Site_Record
	#tag EndProperty

	#tag Property, Flags = &h0
		weight As Double
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="name"
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
			Name="id"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="is_Uppercase"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="weight"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="count"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="efficiency"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Double"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
