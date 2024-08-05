#tag Module
Protected Module Design_Palette
	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If Session.darkmode Then
			    
			    mCOLOR_Background = &c12121200
			    
			  Else
			    
			    mCOLOR_Background = &cFFFFFF00
			    
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

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  If Session.darkmode Then
			    
			    mCOLOR_Border = Color.White
			    
			  Else
			    
			    mCOLOR_Border = Color.Black
			    
			    
			    
			  End If
			  Return mCOLOR_Border
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mCOLOR_Border = value
			End Set
		#tag EndSetter
		COLOR_Border As Color
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

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If Session.darkmode Then
			    
			    mCOLOR_Error = &cCF667900
			    
			  Else
			    
			    mCOLOR_Error = &cB0002000
			    
			  End If
			  Return mCOLOR_Error
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mCOLOR_Error = value
			End Set
		#tag EndSetter
		COLOR_Error As Color
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		COLOR_Foreground As Color = &cFFFEFE00
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If Session.darkmode Then
			    
			    mCOLOR_Note = &cE0F000
			    
			    
			  Else
			    
			    mCOLOR_Note = &c565C00
			    
			  End If
			  
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mCOLOR_Note = value
			End Set
		#tag EndSetter
		COLOR_Note As Color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If Session.darkmode Then
			    
			    mCOLOR_On_Background = &cFFFFFF00
			    
			  Else
			    
			    mCOLOR_On_Background = &c00000000
			    
			  End If
			  
			  
			  
			  Return mCOLOR_On_Background
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mCOLOR_On_Background = value
			End Set
		#tag EndSetter
		COLOR_On_Background As Color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If Session.darkmode Then
			    
			    
			    mCOLOR_On_Primary = &c00000000
			  Else
			    
			    mCOLOR_On_Primary = &cFFFFFF00
			    
			  End If
			  Return mCOLOR_On_Primary
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mCOLOR_On_Error = value
			End Set
		#tag EndSetter
		COLOR_On_Error As Color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If Session.darkmode Then
			    
			    
			    mCOLOR_On_Primary = &c00000000
			  Else
			    
			    mCOLOR_On_Primary = &cFFFFFF00
			    
			  End If
			  Return mCOLOR_On_Primary
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mCOLOR_On_Primary = value
			End Set
		#tag EndSetter
		COLOR_On_Primary As Color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If Session.darkmode Then
			    
			    mCOLOR_On_Primary_Variant = &cFFFFFF00
			    
			  Else
			    
			    mCOLOR_On_Primary_Variant = &c00000000
			    
			  End If
			  Return mCOLOR_On_Primary_Variant
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mCOLOR_On_Primary_Variant = value
			End Set
		#tag EndSetter
		COLOR_On_Primary_Variant As Color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If Session.darkmode Then
			    
			    
			    mCOLOR_On_Warning = &c3B3B3B
			    
			  Else
			    
			    mCOLOR_On_Warning = &c3B3B3B
			    
			  End If
			  Return mCOLOR_On_Warning
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mCOLOR_On_Warning = value
			End Set
		#tag EndSetter
		COLOR_On_Warning As Color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If Session.darkmode Then
			    
			    mCOLOR_Pass = &c018786
			    
			  Else
			    
			    mCOLOR_Pass = &c018786
			    
			  End If
			  
			  Return mCOLOR_Pass
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mCOLOR_Pass = value
			End Set
		#tag EndSetter
		COLOR_Pass As Color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If Session.darkmode Then
			    
			    mCOLOR_Primary = &cBB86FC00
			    
			  Else
			    
			    mCOLOR_Primary = &c6200EE00
			    
			  End If
			  Return mCOLOR_Primary
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mCOLOR_Primary = value
			End Set
		#tag EndSetter
		COLOR_Primary As Color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If Session.darkmode Then
			    
			    mCOLOR_Primary_Variant = &c3700B300
			    
			  Else
			    
			    mCOLOR_Primary_Variant = &c3700B300
			    
			  End If
			  Return mCOLOR_Primary_Variant
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mCOLOR_Primary_Variant = value
			End Set
		#tag EndSetter
		COLOR_Primary_Variant As Color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If Session.darkmode Then
			    
			    mCOLOR_Secondary = &c03DAC600
			    
			  Else
			    
			    mCOLOR_Secondary = &c03DAC600
			    
			    
			  End If
			  Return mCOLOR_Secondary
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mCOLOR_Secondary = value
			End Set
		#tag EndSetter
		COLOR_Secondary As Color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If Session.darkmode Then
			    
			    mCOLOR_Surface_3 = &c403252
			    
			  Else
			    
			    
			  End If
			  Return mCOLOR_Surface_3
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mCOLOR_Surface_3 = value
			End Set
		#tag EndSetter
		COLOR_Surface_3 As Color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If Session.darkmode Then
			    
			    'mCOLOR_Surface = &c12121200
			    mCOLOR_Surface_Primary = &c211D2700
			    'mCOLOR_Surface = &c40325200
			  Else
			    
			    mCOLOR_Surface_Primary = &cFFFFFF
			    
			  End If
			  
			  Return mCOLOR_Surface_Primary
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mCOLOR_Surface_Primary = value
			End Set
		#tag EndSetter
		COLOR_Surface_Primary As Color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  If Session.darkmode Then
			    
			    mCOLOR_Surface_Secondary = &c112422
			    
			  Else
			    
			    
			  End If
			  Return mCOLOR_Surface_Secondary
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mCOLOR_Surface_Secondary = value
			End Set
		#tag EndSetter
		COLOR_Surface_Secondary As Color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If Session.darkmode Then
			    
			    'mCOLOR_Warning = &cD1840000
			    mCOLOR_Warning = &cD4D40300
			  Else
			    
			    'mCOLOR_Warning = &cFFC56100
			    mCOLOR_Warning = &cFFA500
			    
			  End If
			  Return mCOLOR_Warning
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mCOLOR_Warning = value
			End Set
		#tag EndSetter
		COLOR_Warning As Color
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mCOLOR_Background As Color = &c515151
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mCOLOR_Border As Color
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mCOLOR_Error As Color = &c35353500
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mCOLOR_Note As Color = &c00CAED
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mCOLOR_On_Background As Color = &c35353500
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mCOLOR_On_Error As Color = &c54545400
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mCOLOR_On_Primary As Color = &c35353500
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mCOLOR_On_Primary_Variant As Color = &cFFFEFE00
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mCOLOR_On_Warning As Color = &cFFFEFE00
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mCOLOR_Pass As Color = &c2E3136
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mCOLOR_Primary As Color = &c2E3136
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mCOLOR_Primary_Variant As Color = &c55966A
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mCOLOR_Secondary As Color = &c35353500
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mCOLOR_Surface_3 As Color = &cFFFEFE00
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mCOLOR_Surface_Primary As Color
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mCOLOR_Surface_Secondary As Color = &cFFFEFE00
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mCOLOR_Warning As Color = &c55966A
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
		#tag ViewProperty
			Name="COLOR_Background"
			Visible=false
			Group="Behavior"
			InitialValue="&c000000"
			Type="Color"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="COLOR_Date_Weekday"
			Visible=false
			Group="Behavior"
			InitialValue="&c35353500"
			Type="Color"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="COLOR_Date_Weekend"
			Visible=false
			Group="Behavior"
			InitialValue="&c54545400"
			Type="Color"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="COLOR_Surface_Primary"
			Visible=false
			Group="Behavior"
			InitialValue="&c000000"
			Type="Color"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="COLOR_Border"
			Visible=false
			Group="Behavior"
			InitialValue="&c000000"
			Type="Color"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="COLOR_Primary"
			Visible=false
			Group="Behavior"
			InitialValue="&c000000"
			Type="Color"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="COLOR_Primary_Variant"
			Visible=false
			Group="Behavior"
			InitialValue="&c000000"
			Type="Color"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="COLOR_On_Primary"
			Visible=false
			Group="Behavior"
			InitialValue="&c000000"
			Type="Color"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="COLOR_On_Primary_Variant"
			Visible=false
			Group="Behavior"
			InitialValue="&c000000"
			Type="Color"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="COLOR_On_Background"
			Visible=false
			Group="Behavior"
			InitialValue="&c000000"
			Type="Color"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="COLOR_Error"
			Visible=false
			Group="Behavior"
			InitialValue="&c000000"
			Type="Color"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="COLOR_Secondary"
			Visible=false
			Group="Behavior"
			InitialValue="&c000000"
			Type="Color"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Module
#tag EndModule
