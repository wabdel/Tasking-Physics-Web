#tag Class
Protected Class CLASS_Overtime_Type_Record
	#tag Method, Flags = &h0
		Sub Save()
		  
		  
		  
		  If id = 0 Then
		    
		    
		    Var row As New DatabaseRow
		    
		    row.Column("name").StringValue = name.Trim
		    
		    
		    Physics_Tasking.INSERT_Row( "physics_tasking.overtime_types", row)
		    
		    
		    
		    Var sql As String = "SELECT overtime_type_id FROM physics_tasking.overtime_types " _
		    + "ORDER by overtime_type_id DESC LIMIT 1;"
		    
		    Var rs As RowSet = Physics_Tasking.SELECT_Statement( sql)
		    
		    Mid = rs.Column("overtime_type_id").IntegerValue
		    
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
		        db.Prepare("UPDATE physics_tasking.overtime_types SET name = ? " _
		        + "WHERE task_type_id = ?")
		        
		        ps.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_STRING)
		        ps.BindType(1, MySQLPreparedStatement.MYSQL_TYPE_LONG)
		        
		        
		        ps.ExecuteSQL(name.Trim, _
		        id)
		        
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
			  Return mid
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  If value <> 0 Then
			    
			    Var sql As String = "SELECT * " _
			    +"FROM physics_tasking.overtime_types " _
			    +"WHERE overtime_type_id = " + value.ToString
			    
			    Var rs As RowSet = Physics_Tasking.SELECT_Statement( sql)
			    
			    If rs.RowCount = 1 Then
			      
			      name = rs.Column("name").StringValue
			      Mid = value
			      
			    End If
			  End If
			  
			  
			  
			End Set
		#tag EndSetter
		id As Integer
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mid As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		name As String
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
	#tag EndViewBehavior
End Class
#tag EndClass
