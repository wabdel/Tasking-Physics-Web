#tag Module
Protected Module Design_Palette
	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If Session.darkmode Then 
			    
			    mCOLOR_Background = &c18181800
			    
			  Else
			    
			    mCOLOR_Background = &cededed00
			    
			  End If
			  Return mCOLOR_Background
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mCOLOR_Background = value
			End Set
		#tag EndSetter
		COLOR_Background As Color
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		COLOR_Button_Dark As Color = &c2E3136
	#tag EndProperty

	#tag Property, Flags = &h0
		COLOR_Button_Info As Color = &c00CAED
	#tag EndProperty

	#tag Property, Flags = &h0
		COLOR_Button_Light As Color = &cFAFAFA
	#tag EndProperty

	#tag Property, Flags = &h0
		COLOR_Button_Primary As Color = &c006EF8
	#tag EndProperty

	#tag Property, Flags = &h0
		COLOR_Button_Succes As Color = &c55966A
	#tag EndProperty

	#tag Property, Flags = &h0
		COLOR_Central_Background As Color = &c858585
	#tag EndProperty

	#tag Property, Flags = &h0
		COLOR_Central_Background2 As Color = &c77777700
	#tag EndProperty

	#tag Property, Flags = &h0
		COLOR_Date_Weekday As Color = &c35353500
	#tag EndProperty

	#tag Property, Flags = &h0
		COLOR_Date_Weekend As Color = &c54545400
	#tag EndProperty

	#tag Property, Flags = &h0
		COLOR_Foreground As Color = &cFFFEFE00
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mCOLOR_Background As Color = &c515151
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
			Name="mCOLOR_Background"
			Visible=false
			Group="Behavior"
			InitialValue="&c33333300"
			Type="Color"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="COLOR_Button_Dark"
			Visible=false
			Group="Behavior"
			InitialValue="&c2E3136"
			Type="Color"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="COLOR_Button_Info"
			Visible=false
			Group="Behavior"
			InitialValue="&c00CAED"
			Type="Color"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="COLOR_Button_Light"
			Visible=false
			Group="Behavior"
			InitialValue="&cFAFAFA"
			Type="Color"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="COLOR_Button_Primary"
			Visible=false
			Group="Behavior"
			InitialValue="&c006EF8"
			Type="Color"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="COLOR_Button_Succes"
			Visible=false
			Group="Behavior"
			InitialValue="&c55966A"
			Type="Color"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="COLOR_Central_Background"
			Visible=false
			Group="Behavior"
			InitialValue="&c55555500"
			Type="Color"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="COLOR_Central_Background2"
			Visible=false
			Group="Behavior"
			InitialValue="&c77777700"
			Type="Color"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="COLOR_Foreground"
			Visible=false
			Group="Behavior"
			InitialValue="&cFFFEFE00"
			Type="Color"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Module
#tag EndModule
