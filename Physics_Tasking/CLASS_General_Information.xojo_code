#tag Class
Protected Class CLASS_General_Information
	#tag Method, Flags = &h0
		Sub Save()
		  
		  Var sql As String = "SELECT * " _
		  +"FROM general_information " _
		  +"WHERE general_information_id = 1"
		  
		  
		  
		  Var rs As RowSet = Physics_Tasking.SELECT_Statement(sql)
		  
		  If rs.RowCount = 1 Then
		    
		    
		    rs.EditRow
		    rs.Column("hospital_name").StringValue = hospital_name
		    rs.Column("department_name").StringValue = department_name
		    rs.Column("section_name").StringValue = section_name
		    rs.Column("hospital_logo").Value = Hospital_Logo
		    rs.SaveRow
		    
		    
		    
		  Else
		    
		    Var row As New DatabaseRow
		    row.Column("hospital_name").StringValue = hospital_name
		    row.Column("department_name").StringValue= department_name
		    row.Column("section_name").StringValue = section_name
		    row.Column("hospital_logo").PictureValue(Picture.Formats.PNG) = Hospital_Logo
		    Physics_Tasking.INSERT_Row("general_information", row)
		    
		    sql = "SELECT general_information_id  FROM physics_tasking.general_information " _
		    +"ORDER BY general_information_id DESC LIMIT 1;"
		    
		    rs = Physics_Tasking.SELECT_Statement(sql)
		    
		    Mid = rs.Column("general_information_id").IntegerValue
		    
		    
		  End If
		  
		  
		  
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		department_name As String
	#tag EndProperty

	#tag Property, Flags = &h0
		Hospital_Logo As Picture
	#tag EndProperty

	#tag Property, Flags = &h0
		hospital_name As String
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mid
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  Var sql As String = "SELECT * FROM physics_tasking.general_information " _
			  + "WHERE general_information_id = " + value.ToString + ";"
			  
			  Var rs As RowSet = Physics_Tasking.SELECT_Statement( sql)
			  
			  Hospital_Name = rs.Column("hospital_name").StringValue
			  department_name = rs.Column("department_name").StringValue
			  section_name = rs.Column("section_name").StringValue
			  hospital_logo = rs.Column("hospital_logo").PictureValue
			  
			  
			  Mid = value
			  
			End Set
		#tag EndSetter
		id As Integer
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mid As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		section_name As String
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
			Name="hospital_name"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="department_name"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Hospital_Logo"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Picture"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="section_name"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
