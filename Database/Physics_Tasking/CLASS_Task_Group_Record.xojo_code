#tag Class
Protected Class CLASS_Task_Group_Record
	#tag Method, Flags = &h0
		Sub Save()
		  
		  
		  
		  Try
		    
		    If id = 0 Then
		      
		      
		      Var row As New DatabaseRow
		      
		      row.Column("name").StringValue = name.Trim.Lowercase.Trim
		      
		      If db.Connect Then
		        db.AddRow( "task_groups", row)
		      End If
		      
		      db.Close
		      
		      Var sql As String = "SELECT task_group_id FROM Physics_tasking.task_group " _
		      + "ORDER BY task_group_id LIMIT 1;"
		      Var rs As RowSet = Physics_Tasking.DB_SELECT_Statement( sql)
		      
		      Mid = rs.Column("task_group_id").IntegerValue
		      
		      
		      
		      
		      
		    Else
		      
		      If db.Connect Then
		        
		        Var ps As  PreparedSQLStatement = _
		        db.Prepare("UPDATE physics_tasking.task_groups SET name = ?, " _
		        +"WHERE task_group_id = ?")
		        
		        ps.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_STRING)
		        ps.BindType(1, MySQLPreparedStatement.MYSQL_TYPE_LONG)
		        
		        ps.ExecuteSQL(name.Trim.Lowercase.Trim, id)
		        
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


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mid
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  If value <> 0  Then
			    
			    Var sql As String = "SELECT task_group_id, name " _
			    +"FROM physics_tasking.task_groups " _
			    +"WHERE task_group_id = " + value.ToString
			    
			    Var rs As RowSet = Physics_Tasking.DB_SELECT_Statement( sql)
			    
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
