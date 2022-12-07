#tag Class
Protected Class CLASS_Group_Record
	#tag Method, Flags = &h0
		Sub Save()
		  Var db As New MySQLCommunityServer
		  
		  db.Host = Physics_Tasking.DB_Host
		  db.Port = Physics_Tasking.DB_Port
		  db.DatabaseName = Physics_Tasking.DB_DatabaseName
		  db.UserName = Physics_Tasking.DB_UserName
		  db.Password = Physics_Tasking.DB_Password
		  
		  Try
		    
		    If id = 0 Then
		      
		      Var row As New DatabaseRow
		      
		      row.Column("name").StringValue = name.Trim.Lowercase.Trim
		      
		      If db.Connect Then
		        db.AddRow("categories", row)
		        
		      End If
		      
		      db.Close
		      
		      Var sql as string = "SELECT category_id FROM physics_tasking.cotegories " _
		      + " ORDER category_id id DESC LIMIT 1;"
		      Var rs As RowSet = Physics_Tasking.DB_SELECT_Statement( sql)
		      
		      Mid = rs.Column("category_id").IntegerValue
		      
		      
		    Else
		      
		      If db.Connect Then
		        
		        Var ps As  PreparedSQLStatement = _
		        db.Prepare("UPDATE categories SET name = ?, " _
		        +"WHERE category_id = ?")
		        
		        ps.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_STRING)
		        ps.BindType(1, MySQLPreparedStatement.MYSQL_TYPE_LONG)
		        
		        ps.ExecuteSQL(name.Trim.Lowercase.Trim, id)
		        
		      End If
		    End If
		    
		    Return
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


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mid
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  Var sql As String = "SELECT category_id, name " _
			  +"FROM categories " _
			  +"WHERE category_id = "+Str(value)
			  
			  Var rs As RowSet = Physics_Tasking.DB_SELECT_Statement( sql)
			  
			  If rs.RowCount = 1 Then
			    
			    name = rs.Column("name").StringValue
			    Mid = value
			    
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
