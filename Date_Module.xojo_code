#tag Module
Protected Module Date_Module
	#tag Method, Flags = &h0
		Function Get_Month_Abbr(m as Integer) As String
		  Select Case m
		  Case 1
		    
		    Return "Jan"
		    
		  Case 2
		    
		    Return "Feb"
		    
		    
		  Case 3
		    Return "Mar"
		    
		  Case 4
		    Return "Apr"
		    
		  Case 5
		    Return "May"
		    
		  Case 6
		    Return "Jun"
		    
		  Case 7
		    Return "Jul"
		    
		  Case 8
		    Return "Aug"
		    
		  Case 9
		    Return "Sep"
		    
		  Case 10
		    Return "Oct"
		    
		  Case 11
		    Return "Nov"
		    
		  Case 12
		    Return "Dec"
		    
		    
		  Else
		    Return "NAN"
		    
		    
		  End Select
		End Function
	#tag EndMethod


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
	#tag EndViewBehavior
End Module
#tag EndModule
