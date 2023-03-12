#tag Module
Protected Module Color_Palette
	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  Select Case Session.DarkMode
			  Case True
			    
			    Return &cDCBD5B
			    
			  Else
			    
			    Return &cE91E63
			    
			  End Select
			End Get
		#tag EndGetter
		Protected Caution As Color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  Select Case Session.DarkMode
			  Case True
			    
			    Return &cC04842
			    
			  Else
			    
			    Return &cE91E63
			    
			  End Select
			End Get
		#tag EndGetter
		Protected Fail As Color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  Select Case Session.DarkMode
			  Case True
			    
			    Return &c8DAAF4
			    
			  Else
			    
			    Return &cBB86FC
			    
			  End Select
			End Get
		#tag EndGetter
		Protected Note As Color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  Select Case Session.DarkMode
			  Case True
			    
			    Return &c9ED685
			    
			  Else
			    
			    Return &c60C689
			    
			  End Select
			End Get
		#tag EndGetter
		Protected Pass As Color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  Select Case Session.DarkMode
			  Case True
			    
			    Return &cBB86FC
			    
			  Else
			    
			    Return &cBB86FC
			    
			  End Select
			End Get
		#tag EndGetter
		Protected Primary As Color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  Select Case Session.DarkMode
			  Case True
			    
			    Return &c3700B3
			    
			  Else
			    
			    Return &cBB86FC
			    
			  End Select
			End Get
		#tag EndGetter
		Protected Primary_Variant As Color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  Select Case Session.DarkMode
			  Case True
			    
			    Return &c03DAC6
			    
			  Else
			    
			    Return &cBB86FC
			    
			  End Select
			End Get
		#tag EndGetter
		Protected Secondary As Color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  Select Case Session.DarkMode
			  Case True
			    
			    Return &c03DAC6
			    
			  Else
			    
			    Return &cBB86FC
			    
			  End Select
			End Get
		#tag EndGetter
		Protected Secondary_Variant As Color
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
	#tag EndViewBehavior
End Module
#tag EndModule
