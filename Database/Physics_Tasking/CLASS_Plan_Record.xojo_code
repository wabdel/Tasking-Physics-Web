#tag Class
Protected Class CLASS_Plan_Record
	#tag Method, Flags = &h0
		Sub Constructor()
		  Patient_Record = New Physics_Tasking.CLASS_Patient_Record
		  Plan_Type_Record = New Physics_Tasking.CLASS_Plan_Type_Record
		  User_Record = New Physics_Tasking.CLASS_User_Record
		  Physician_Record = New Physics_Tasking.CLASS_User_Record
		  Assigned_by_User_Record = New Physics_Tasking.CLASS_User_Record
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Days_To_Start_Date() As Integer
		  
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
		Sub Save()
		  Patient_Record.Save
		  
		  Var db As New MySQLCommunityServer
		  
		  db.Host = Physics_Tasking.DB_Host
		  db.Port = Physics_Tasking.DB_Port
		  db.DatabaseName = Physics_Tasking.DB_DatabaseName
		  db.UserName = Physics_Tasking.DB_UserName
		  db.Password = Physics_Tasking.DB_Password
		  
		  
		  Try
		    
		    If id = 0 Then
		      
		      If db.Connect Then
		        Var row As New DatabaseRow
		        
		        row.Column("patient_id").IntegerValue = Patient_Record.id
		        row.Column("plan_type_id").IntegerValue = Plan_Type_Record.id
		        row.Column("user_id").IntegerValue = User_Record.id
		        row.Column("assignment_date").DateTimeValue = Assignment_Date
		        row.Column("assigned_by_id").IntegerValue = Assigned_by_User_Record.id
		        row.Column("due_date").DateValue = mDue_Date
		        row.Column("is_completed").BooleanValue = False
		        row.Column("notes").BlobValue = notes
		        
		        db.AddRow("plans", row)
		      End If
		      db.Close
		      
		      
		      
		      Var sql As String = "SELECT plan_id FROM physics_tasking.plans " _
		      + "ORDER by plan_id LIMIT 1;"
		      
		      Var rs As RowSet = Physics_Tasking.DB_SELECT_Statement(sql)
		      
		      Mid = rs.Column("plan_id").IntegerValue
		      
		      
		      
		    Else
		      
		      If db.Connect Then
		        
		        Var ps As  PreparedSQLStatement = _
		        db.Prepare("UPDATE plans SET patient_id = ?, " _
		        +"plan_type_id = ?, " _
		        +"user_id = ?, " _
		        +"assignment_date = ?, " _
		        +"assigned_by_id = ?, " _
		        +"due_date = ?, " _
		        +"is_completed = ?, " _
		        +"completion_date = ?, " _
		        +"notes = ? WHERE " _
		        +"plan_id = ?")
		        
		        ps.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_LONG)
		        ps.BindType(1, MySQLPreparedStatement.MYSQL_TYPE_LONG)
		        ps.BindType(2, MySQLPreparedStatement.MYSQL_TYPE_LONG)
		        ps.BindType(3, MySQLPreparedStatement.MYSQL_TYPE_DATETIME)
		        ps.BindType(4, MySQLPreparedStatement.MYSQL_TYPE_LONG)
		        ps.BindType(5, MySQLPreparedStatement.MYSQL_TYPE_DATE)
		        ps.BindType(6, MySQLPreparedStatement.MYSQL_TYPE_LONG)
		        
		        ps.BindType(7, MySQLPreparedStatement.MYSQL_TYPE_DATETIME)
		        ps.BindType(8, MySQLPreparedStatement.MYSQL_TYPE_BLOB)
		        ps.BindType(9, MySQLPreparedStatement.MYSQL_TYPE_LONG)
		        
		        If Completion_Date = Nil Then
		          
		          ps.ExecuteSQL(Patient_Record.id, _
		          Plan_Type_Record.id, _
		          User_Record.id, _
		          Assignment_Date, _
		          Assigned_by_User_Record.id, _
		          Due_Date, _
		          isCompleted, _
		          DateTime.Now, _
		          notes, _
		          id )
		          
		          
		          Var ps_Null As PreparedSQLStatement = _
		          db.Prepare("UPDATE plans SET completion_date = NULL " _
		          +"WHERE plan_id = ?")
		          
		          ps_Null.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_LONG)
		          
		          ps_Null.ExecuteSQL( id  )
		          
		          
		        Else
		          
		          ps.ExecuteSQL(Patient_Record.id, _
		          Plan_Type_Record.id, _
		          User_Record.id, _
		          Assignment_Date, _
		          Assigned_by_User_Record.id, _
		          Due_Date, _
		          isCompleted, _
		          Completion_Date, _
		          notes, _
		          id )
		          
		        End If
		        
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
		Assigned_by_User_Record As Physics_Tasking.CLASS_User_Record
	#tag EndProperty

	#tag Property, Flags = &h0
		Assignment_Date As DateTime
	#tag EndProperty

	#tag Property, Flags = &h0
		Completion_Date As DateTime
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Var sql As String = "SELECT due_date " _
			  +"FROM physics_tasking.plans " _
			  +"WHERE plan_id = " + Mid.ToString + ";"
			  
			  Var rs As RowSet = Physics_Tasking.DB_SELECT_Statement(sql)
			  
			  mDue_Date = rs.Column("due_date").DateTimeValue
			  Return mDue_Date
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mDue_Date = value
			End Set
		#tag EndSetter
		Due_Date As DateTime
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mid
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  
			  Var sql As String = "SELECT * " _
			  +"FROM physics_tasking.plans " _
			  +"WHERE plan_id = " + value.ToString + ";"
			  
			  Var rs As RowSet = Physics_Tasking.DB_SELECT_Statement( sql)
			  
			  If rs.RowCount = 1 Then
			    
			    Patient_Record.id = rs.Column("patient_id").IntegerValue
			    Plan_Type_Record.id = rs.Column("plan_type_id").IntegerValue
			    User_Record.id = rs.Column("user_id").IntegerValue
			    Physician_Record.id = rs.Column("physician_id").IntegerValue
			    assignment_date = rs.Column("assignment_date").DateTimeValue
			    Assigned_by_User_Record.id = rs.Column("assigned_by_id").IntegerValue
			    due_date = rs.Column("due_date").DateTimeValue
			    isCompleted = rs.Column("is_completed").BooleanValue
			    Completion_Date = rs.Column("completion_date").DateTimeValue
			    notes = rs.Column("notes").StringValue.ToText
			    mid = value
			    
			  End If
			  
			  
			  
			End Set
		#tag EndSetter
		id As Integer
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		isCompleted As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mDue_Date As DateTime
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mid As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		notes As Text
	#tag EndProperty

	#tag Property, Flags = &h0
		Patient_Record As Physics_Tasking.CLASS_Patient_Record
	#tag EndProperty

	#tag Property, Flags = &h0
		Physician_Record As Physics_Tasking.CLASS_User_Record
	#tag EndProperty

	#tag Property, Flags = &h0
		Plan_Type_Record As Physics_Tasking.CLASS_Plan_Type_Record
	#tag EndProperty

	#tag Property, Flags = &h0
		User_Record As Physics_Tasking.CLASS_User_Record
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
			Name="id"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="isCompleted"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="notes"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Text"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
