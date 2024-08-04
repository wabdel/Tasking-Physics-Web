#tag Class
Protected Class CLASS_Patient_Record
	#tag Method, Flags = &h0
		Sub Save()
		  
		  
		  
		  If id = 0 Then
		    
		    Var row As New DatabaseRow
		    
		    row.Column("first_name").StringValue = first_name
		    row.Column("family_name").StringValue = family_name
		    row.Column("mrn").StringValue = mrn
		    
		    
		    
		    
		    Physics_Tasking.INSERT_Row("patients", row)
		    
		    
		    
		    Var sql as String  = "SELECT patient_id FROM physics_tasking.patients " _
		    + "ORDER BY patient_id DESC LIMIT 1;"
		    
		    Var rs As RowSet = Physics_Tasking.SELECT_Statement( sql)
		    
		    Mid = rs.Column("patient_id").IntegerValue
		    
		    
		    
		    
		  Else
		    
		    Var db As New MySQLCommunityServer
		    db.Host = Physics_Tasking.db_host
		    db.Port = Physics_Tasking.db_port
		    db.DatabaseName = Physics_Tasking.db_name
		    db.UserName = Physics_Tasking.db_username
		    
		    Try
		      
		      If db.Connect Then
		        
		        Var ps As  PreparedSQLStatement = _
		        db.Prepare("UPDATE patients SET first_name = ?, " _
		        +"family_name = ?, " _
		        +"mrn = ? WHERE " _
		        +"patient_id = ?")
		        
		        ps.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_STRING)
		        ps.BindType(1, MySQLPreparedStatement.MYSQL_TYPE_STRING)
		        ps.BindType(2, MySQLPreparedStatement.MYSQL_TYPE_STRING)
		        ps.BindType(3, MySQLPreparedStatement.MYSQL_TYPE_LONG)
		        
		        
		        ps.ExecuteSQL(first_name, _
		        family_name, _
		        mrn, _
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
			  
			  If App.ananomize Then
			    
			    Return ""
			    
			  Else
			    
			    Return mfamily_name
			    
			  End If
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mfamily_name = value
			End Set
		#tag EndSetter
		family_name As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If App.ananomize Then
			    
			    Return "Patient " + Format( id, "000000")
			    
			  Else
			    
			    Return mfirst_name
			    
			  End If
			  
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mfirst_name = value
			End Set
		#tag EndSetter
		first_name As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  Return first_name.Trim.Titlecase+ " " + family_name.Trim.Uppercase
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mfull_name = value
			End Set
		#tag EndSetter
		full_name As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mid
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  
			  Var sql As String = "SELECT * FROM physics_tasking.patients WHERE " _
			  + "patient_id = " + value.ToString
			  
			  Var rs As RowSet = Physics_Tasking.SELECT_Statement( sql)
			  
			  
			  If rs.RowCount = 1 Then
			    
			    first_name = rs.Column("first_name").StringValue.Trim.Titlecase
			    family_name = rs.Column("family_name").StringValue.Trim.Uppercase
			    mmrn = rs.Column("mrn").StringValue
			    
			    Mid = value
			    
			  End If
			  
			  
			  
			  
			  
			End Set
		#tag EndSetter
		id As Integer
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mfamily_name As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mfirst_name As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mfull_name As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mid As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mmrn As String
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If App.ananomize Then
			    
			    Return Format( id, "000000")
			    
			  Else
			    
			    Return mmrn
			    
			  End If
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  Var sql As String = "SELECT * FROM physics_tasking.patients WHERE " _
			  + "mrn = '" + value + "';"
			  
			  Var rs As RowSet = Physics_Tasking.SELECT_Statement( sql)
			  
			  
			  If rs.RowCount = 1 Then
			    
			    first_name = rs.Column("first_name").StringValue.Trim.Titlecase
			    family_name = rs.Column("family_name").StringValue.Trim.Uppercase
			    Mid = rs.Column("patient_id").IntegerValue
			    
			  End If
			  
			  mmrn = value
			  
			  
			End Set
		#tag EndSetter
		mrn As String
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
			Name="mrn"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="family_name"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="first_name"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="full_name"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
