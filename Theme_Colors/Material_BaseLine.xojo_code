#tag Module
Protected Module Material_BaseLine
	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  Var mTemp As New WebStyle
			  
			  If Session.DarkMode Then
			    
			    mTemp.value("background-color") = "#121212;"
			    mTemp.value("color") = "#FFFFFF;"
			    
			  Else
			    
			    mTemp.value("background-color") = "#FFFFFF;"
			    mTemp.value("color") = "#000000;"
			    
			  End If
			  
			  Return mTemp
			End Get
		#tag EndGetter
		Protected Background As WebStyle
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  Var mTemp As New WebStyle
			  
			  If Session.DarkMode Then
			    
			    mTemp.value("background-color") = "#CF6679;"
			  Else
			    
			    mTemp.value("background-color") = "#B00020;"
			    
			  End If
			  
			  Return mTemp
			End Get
		#tag EndGetter
		Protected Error As WebStyle
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  Var mTemp As New WebStyle
			  
			  If Session.DarkMode Then
			    
			    mTemp.value("background-color") = "#121212;"
			    mTemp.value("color") = "#FFFFFF;"
			    
			  Else
			    
			    mTemp.value("color") = "#000000;"
			    
			  End If
			  
			  Return mTemp
			End Get
		#tag EndGetter
		Protected On_Background As WebStyle
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  Var mTemp As New WebStyle
			  
			  If Session.DarkMode Then
			    
			    mTemp.value("color") = "#000000;"
			  Else
			    
			    mTemp.value("color") = "#FFFFFF;"
			    
			  End If
			  
			  Return mTemp
			End Get
		#tag EndGetter
		Protected On_Error As WebStyle
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  Var mTemp As New WebStyle
			  
			  If Session.DarkMode Then
			    
			    mTemp.value("background-color") = "#BB86FC;"
			    mTemp.value("color") = "#000000;"
			  Else
			    
			    mTemp.value("color") = "#FFFFFF;"
			    
			  End If
			  
			  Return mTemp
			End Get
		#tag EndGetter
		Protected On_Primary As WebStyle
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  Var mTemp As New WebStyle
			  
			  If Session.DarkMode Then
			    
			    mTemp.value("background-color") = "#03DAC6;"
			    mTemp.value("color") = "#FFFFFF;"
			    
			  Else
			    
			    mTemp.value("background-color") = "#000000;"
			    
			  End If
			  
			  Return mTemp
			End Get
		#tag EndGetter
		Protected On_Secondary As WebStyle
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  Var mTemp As New WebStyle
			  
			  If Session.DarkMode Then
			    
			    mTemp.value("background-color") = "#242424;"
			    mTemp.value("color") = "#FFFFFF;"
			    
			  Else
			    
			    mTemp.value("background-color") = "#FFFFFF;"
			    mTemp.value("color") = "#000000;"
			    
			    
			  End If
			  
			  Return mTemp
			End Get
		#tag EndGetter
		Protected On_Surface As WebStyle
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  Var mTemp As New WebStyle
			  
			  If Session.DarkMode Then
			    
			    mTemp.value("background-color") = "#363636;"
			    mTemp.value("color") = "#FFFFFF;"
			    
			  Else
			    
			    mTemp.value("background-color") = "#FFFFFF;"
			    mTemp.value("color") = "#0000000;"
			    
			  End If
			  
			  Return mTemp
			End Get
		#tag EndGetter
		Protected On_Surface_Variant As WebStyle
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  Var mTemp As New WebStyle
			  
			  If Session.DarkMode Then
			    
			    mTemp.value("background-color") = "#BB86FC;"
			    
			  Else
			    
			    mTemp.value("background-color") = "#6200EE;"
			    
			  End If
			  
			  Return mTemp
			End Get
		#tag EndGetter
		Protected Primary As WebStyle
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  Var mTemp As New WebStyle
			  
			  If Session.DarkMode Then
			    
			    mTemp.value("background-color") = "#3700B3;"
			  Else
			    
			    mTemp.value("background-color") = "#3700B3;"
			    
			  End If
			  
			  Return mTemp
			End Get
		#tag EndGetter
		Protected Primary_Variant As WebStyle
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  Var mTemp As New WebStyle
			  
			  If Session.DarkMode Then
			    
			    mTemp.value("background-color") = "#03DAC6;"
			    mTemp.value("color") = "#121212;"
			  Else
			    
			    mTemp.value("background-color") = "#03DAC6;"
			    
			  End If
			  
			  Return mTemp
			End Get
		#tag EndGetter
		Protected Secondary As WebStyle
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  Var mTemp As New WebStyle
			  
			  
			  If Session.DarkMode Then
			    
			    mTemp.value("background-color") = "#03DAC6;"
			  Else
			    
			    mTemp.value("background-color") = "#018786;"
			    
			  End If
			  
			  Return mTemp
			End Get
		#tag EndGetter
		Protected Secondary_Variant As WebStyle
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  Var mTemp As New WebStyle
			  
			  If Session.DarkMode Then
			    
			    mTemp.value("background-color") = "#FFD479;"
			    mTemp.value("color") = "#121212;"
			    
			  Else
			    
			    mTemp.value("background-color") = "#000000;"
			    
			  End If
			  
			  Return mTemp
			End Get
		#tag EndGetter
		Protected Style_TextField As WebStyle
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  Var mTemp As New WebStyle
			  
			  If Session.DarkMode Then
			    
			    mTemp.value("background-color") = "#242424;"
			    mTemp.value("color") = "#FFFFFF;"
			    
			    
			  Else
			    
			    mTemp.value("background-color") = "#FFFFFF;"
			    
			  End If
			  
			  Return mTemp
			End Get
		#tag EndGetter
		Protected Surface As WebStyle
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  Var mTemp As New WebStyle
			  
			  If Session.DarkMode Then
			    
			    mTemp.value("background-color") = "#363636;"
			    mTemp.value("color") = "#020202;"
			    
			    
			  Else
			    
			    mTemp.value("background-color") = "#FFFFFF;"
			    
			  End If
			  
			  Return mTemp
			End Get
		#tag EndGetter
		Protected Surface_Variant As WebStyle
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  Var mTemp As New WebStyle
			  
			  'mWall_Paper.BackgroundColor = &c78987312
			  
			  mTemp.Value("background-image") = "linear-gradient(red, orange, yellow, green, blue, indigo, violet);"
			  
			  Return mTemp
			End Get
		#tag EndGetter
		Protected Wall_Paper As webstyle
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
