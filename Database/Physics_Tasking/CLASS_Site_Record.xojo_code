#tag Class
Protected Class CLASS_Site_Record
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
		  + "WHERE physics_tasking.sites.site_id = " + id.ToString +" " _
		  + "AND assignment_date BETWEEN '" + d_initial.SQLDate + "' AND '" + d_final.SQLDate + "';"
		  
		  Return Physics_Tasking.DB_SELECT_Statement( sql)
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Save()
		  
		  
		  Try
		    
		    If id = 0 Then
		      
		      
		      
		      Var row As New DatabaseRow
		      
		      row.Column("name").StringValue = name.Trim
		      row.Column("is_uppercase").BooleanValue = is_Uppercase
		      
		      If db.Connect Then
		        
		        db.AddRow( "sites", row)
		        
		      End If
		      db.Close
		      
		      Var sql as String = "SELECT site_id FROM physics_tasking.sites " _
		      + "ORDER BY site_id DESC LIMIT 1;"
		      
		      Var rs As RowSet = Physics_Tasking.DB_SELECT_Statement( sql)
		      
		      Mid = rs.Column("site_id").IntegerValue
		      
		    Else
		      
		      If db.Connect Then
		        
		        Var ps As  PreparedSQLStatement = _
		        db.Prepare("UPDATE physics_tasking.sites SET name = ?, " _
		        +"is_uppercase = ? " _
		        +"WHERE site_id = ?")
		        
		        ps.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_STRING)
		        ps.BindType(1, MySQLPreparedStatement.MYSQL_TYPE_LONG)
		        ps.BindType(2, MySQLPreparedStatement.MYSQL_TYPE_LONG)
		        
		        
		        ps.ExecuteSQL(mname.Trim, is_Uppercase, id)
		        
		        
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
			  
			  
			  Var sql As String = "SELECT COUNT(*) " _
			  + "FROM physics_tasking.plans " _
			  + "INNER JOIN physics_tasking.plan_types " _
			  + "ON  physics_tasking.plans.plan_type_id = physics_tasking.plan_types.plan_type_id " _
			  + "INNER JOIN  physics_tasking.sites " _
			  + "ON physics_tasking.plan_types.site_id = physics_tasking.sites.site_id " _
			  + "WHERE physics_tasking.sites.site_id = " + id.ToString + ";"
			  
			  Var rs As RowSet = Physics_Tasking.DB_SELECT_Statement( sql)
			  
			  
			  mcount = rs.Column("COUNT(*)").IntegerValue
			  Return mCount
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mCount = value
			End Set
		#tag EndSetter
		count As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mid
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  
			  
			  Var sql As String = "SELECT site_id, name, is_uppercase " _
			  +"FROM physics_tasking.sites " _
			  +"WHERE site_id = "+Str(value)
			  
			  Var rs As RowSet = Physics_Tasking.DB_SELECT_Statement( sql)
			  
			  If rs.RowCount = 1 Then
			    
			    mname = rs.Column("name").StringValue
			    is_Uppercase = rs.Column("is_uppercase").BooleanValue
			    
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
		Private mCount As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mid As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mname As String
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If is_Uppercase Then
			    
			    Return mname.Trim.Uppercase
			    
			  Else
			    
			    Return mname.Trim.Titlecase
			    
			  End If
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mname = value
			End Set
		#tag EndSetter
		name As String
	#tag EndComputedProperty


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
			Name="is_Uppercase"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
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
	#tag EndViewBehavior
End Class
#tag EndClass
