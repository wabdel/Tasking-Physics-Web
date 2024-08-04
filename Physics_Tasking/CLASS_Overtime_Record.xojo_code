#tag Class
Protected Class CLASS_Overtime_Record
	#tag Method, Flags = &h0
		Sub Constructor()
		  Overtime_Type_Record = New Physics_Tasking.CLASS_Overtime_Type_Record
		  User_Record = New Physics_Tasking.CLASS_User_Record
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Save()
		  
		  
		  
		  
		  If id = 0 Then
		    
		    
		    
		    Var row As New DatabaseRow
		    
		    row.Column("overtime_type_id").IntegerValue = Overtime_Type_Record.id
		    row.Column("user_id").IntegerValue = User_Record.id
		    row.Column("time_in").DateTimeValue = Time_In
		    row.Column("time_out").DateTimeValue = Time_Out
		    
		    row.Column("notes").BlobValue = notes
		    
		    
		    Physics_Tasking.INSERT_Row("physics_tasking.overtimes", row)
		    
		    
		    Var sql As String = "SELECT overtime_id FROM physics_tasking.overtimes " _
		    + "ORDER BY overtime_id DESC LIMIT 1;"
		    Var rs As RowSet = Physics_Tasking.SELECT_Statement( sql)
		    
		    Mid = rs.Column("overtime_id").IntegerValue
		    
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
		        db.Prepare("UPDATE overtimes SET overtime_type_id = ?, " _
		        +"user_id = ?, " _
		        +"time_in = ?, " _
		        +"time_out = ?, " _
		        +"notes = ?, " _
		        +"WHERE " _
		        +"overtime_id = ?")
		        
		        ps.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_LONG)
		        ps.BindType(1, MySQLPreparedStatement.MYSQL_TYPE_LONG)
		        ps.BindType(2, MySQLPreparedStatement.MYSQL_TYPE_DATETIME)
		        ps.BindType(3, MySQLPreparedStatement.MYSQL_TYPE_DATETIME)
		        ps.BindType(4, MySQLPreparedStatement.MYSQL_TYPE_BLOB)
		        ps.BindType(5, MySQLPreparedStatement.MYSQL_TYPE_LONG)
		        
		        ps.ExecuteSQL(Overtime_Type_Record.id, _
		        User_Record.id, _
		        Time_In, _
		        Time_Out, _
		        notes, _
		        id )
		        
		        
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
			  Return mhours
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mhours = value
			End Set
		#tag EndSetter
		hours As Double
	#tag EndComputedProperty

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
			    +"FROM physics_tasking.overtimes " _
			    +"WHERE overtime_id = " + value.ToString
			    
			    Var rs As RowSet = Physics_Tasking.SELECT_Statement( sql)
			    
			    If rs.RowCount = 1 Then
			      
			      Overtime_Type_Record.id = rs.Column("overtime_type_id").IntegerValue
			      User_Record.id = rs.Column("user_id").IntegerValue
			      Time_In = rs.Column("time_in").DateTimeValue
			      Time_Out = rs.Column("time_out").DateTimeValue
			      notes = rs.Column("notes").StringValue.ToText
			      Mid = value
			      
			    End If
			  End If
			  
			  
			End Set
		#tag EndSetter
		id As Integer
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mhours As Double
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mid As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		notes As Text
	#tag EndProperty

	#tag Property, Flags = &h0
		Overtime_Type_Record As Physics_Tasking.CLASS_Overtime_Type_Record
	#tag EndProperty

	#tag Property, Flags = &h0
		Time_In As DateTime
	#tag EndProperty

	#tag Property, Flags = &h0
		Time_Out As DateTime
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
			Name="hours"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Double"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
