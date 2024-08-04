#tag Class
Protected Class CLASS_Task_Type_Record
	#tag Method, Flags = &h0
		Sub Constructor()
		  Task_Group_Record = New Physics_Tasking.CLASS_Task_Group_Record
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Save()
		  
		  
		  If id = 0 Then
		    
		    
		    Var row As New DatabaseRow
		    
		    row.Column("name").StringValue = name.Trim
		    row.Column("weight").DoubleValue = weight
		    row.Column("task_group_id").IntegerValue = Task_Group_Record.id
		    row.Column("has_multiplier").BooleanValue = has_multiplier
		    row.Column("instructions").StringValue = instructions
		    
		    
		    
		    Physics_Tasking.INSERT_Row( "physics_tasking.task_types", row)
		    
		    Var sql As String = "SELECT task_group_id FROM physics_tasking.task_group " _
		    + "ORDER by task_group_id DESC LIMIT 1;"
		    
		    Var rs As RowSet = Physics_Tasking.SELECT_Statement( sql)
		    
		    Mid = rs.Column("task_group_id").IntegerValue
		    
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
		        db.Prepare("UPDATE physics_tasking.task_types SET name = ?, " _
		        +"weight = ?, has_multiplier = ?, instructions = ?, task_group_id = ? " _
		        +"WHERE task_type_id = ?")
		        
		        ps.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_STRING)
		        ps.BindType(1, MySQLPreparedStatement.MYSQL_TYPE_DOUBLE)
		        ps.BindType(2, MySQLPreparedStatement.MYSQL_TYPE_LONG)
		        ps.BindType(3, MySQLPreparedStatement.MYSQL_TYPE_STRING)
		        ps.BindType(4, MySQLPreparedStatement.MYSQL_TYPE_LONG)
		        ps.BindType(5, MySQLPreparedStatement.MYSQL_TYPE_LONG)
		        
		        
		        ps.ExecuteSQL(name.Trim, _
		        weight, _
		        has_Multiplier, _
		        Instructions, _
		        Task_Group_Record.id, _
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


	#tag Property, Flags = &h0
		has_multiplier As Boolean = False
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
			    +"FROM physics_tasking.task_types " _
			    +"WHERE task_type_id = " + value.ToString
			    
			    Var rs As RowSet = Physics_Tasking.SELECT_Statement( sql)
			    
			    If rs.RowCount = 1 Then
			      
			      name = rs.Column("name").StringValue
			      weight = rs.Column("weight").DoubleValue
			      has_multiplier = rs.Column("has_multiplier").BooleanValue
			      instructions = rs.Column("Instructions").StringValue.ToText
			      Task_Group_Record.id = rs.Column("task_group_id").IntegerValue
			      
			      Mid = value
			      
			    End If
			  End If
			  
			  
			  
			End Set
		#tag EndSetter
		id As Integer
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		instructions As Text
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mid As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		name As String
	#tag EndProperty

	#tag Property, Flags = &h0
		Task_Group_Record As Physics_Tasking.CLASS_Task_Group_Record
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
			Name="has_multiplier"
			Visible=false
			Group="Behavior"
			InitialValue="False"
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
			Name="instructions"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Text"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
