#tag Class
Protected Class CLASS_Task_Record
	#tag Method, Flags = &h0
		Sub Constructor()
		  Task_Type_Record = New Physics_Tasking.CLASS_Task_Type_Record
		  User_Record = New Physics_Tasking.CLASS_User_Record
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Save()
		  
		  
		  Try
		    
		    If id = 0 Then
		      
		      
		      
		      Var row As New DatabaseRow
		      
		      row.Column("task_type_id").IntegerValue = Task_Type_Record.id
		      row.Column("user_id").IntegerValue = User_Record.id
		      row.Column("multiplier").IntegerValue = Multiplier
		      row.Column("completion_date").DateTimeValue = Completion_Date
		      row.Column("notes").BlobValue = notes
		      
		      If db.Connect Then
		        db.AddRow("tasks", row)
		        
		      End If
		      
		      db.close
		      
		      Var sql As String = "SELECT task_id FROM physics_tasking.tasks " _
		      + "ORDER BY task_id DESC LIMIT 1;"
		      Var rs As RowSet = Physics_Tasking.DB_SELECT_Statement( sql)
		      
		      Mid = rs.Column("task_id").IntegerValue
		      
		    Else
		      
		      If db.Connect Then
		        
		        Var ps As  PreparedSQLStatement = _
		        db.Prepare("UPDATE tasks SET task_type_id = ?, " _
		        +"user_id = ?, " _
		        +"multiplier = ?, " _
		        +"completion_date = ?, " _
		        +"notes = ?, " _
		        +"link_id = ? " _
		        +"WHERE " _
		        +"task_id = ?")
		        
		        ps.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_LONG)
		        ps.BindType(1, MySQLPreparedStatement.MYSQL_TYPE_LONG)
		        ps.BindType(2, MySQLPreparedStatement.MYSQL_TYPE_LONG)
		        ps.BindType(3, MySQLPreparedStatement.MYSQL_TYPE_DATETIME)
		        ps.BindType(4, MySQLPreparedStatement.MYSQL_TYPE_BLOB)
		        ps.BindType(5, MySQLPreparedStatement.MYSQL_TYPE_LONG)
		        ps.BindType(6, MySQLPreparedStatement.MYSQL_TYPE_LONG)
		        
		        
		        
		        ps.ExecuteSQL(Task_Type_Record.id, _
		        User_Record.id, _
		        Multiplier, _
		        Completion_Date, _
		        notes, _
		        link_id, _
		        id )
		        
		        
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
		Completion_Date As DateTime
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mid
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  If value <> 0 Then
			    
			    Var sql As String = "SELECT * " _
			    +"FROM physics_tasking.tasks " _
			    +"WHERE task_id = " + value.ToString
			    
			    Var rs As RowSet = Physics_Tasking.DB_SELECT_Statement( sql)
			    
			    If rs.RowCount = 1 Then
			      
			      Task_Type_Record.id = rs.Column("task_type_id").IntegerValue
			      User_Record.id = rs.Column("user_id").IntegerValue
			      Multiplier = rs.Column("multiplier").IntegerValue
			      Completion_Date = rs.Column("completion_date").DateTimeValue
			      notes = rs.Column("notes").StringValue.ToText
			      Mid = value
			      
			    End If
			  End If
			  
			  
			End Set
		#tag EndSetter
		id As Integer
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		link_id As Integer = 0
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mid As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		Multiplier As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		notes As Text
	#tag EndProperty

	#tag Property, Flags = &h0
		Task_Type_Record As Physics_Tasking.CLASS_Task_Type_Record
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
			Name="notes"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Text"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Multiplier"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="link_id"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
