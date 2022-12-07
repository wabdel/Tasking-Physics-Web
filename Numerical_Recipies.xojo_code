#tag Module
Protected Module Numerical_Recipies
	#tag Method, Flags = &h0
		Function Cummulative_Normal_Distribution(z as Double) As double
		  If z > 6 Then Return 1.0
		  If z< -6 Then Return 0.0
		  
		  
		  Const b1 As Double = 0.31938153
		  Const b2 As Double = -0.356563782
		  Const b3 As Double = 1.781477937
		  Const b4 As Double = -1.821255978
		  Const b5 As Double = 1.330274429
		  
		  Const p As Double = 0.2316419
		  
		  Const c2 As Double = 0.3989423
		  
		  Var a As Double = abs(z)
		  
		  Var t As Double = 1.0 / (1.0 + a * p)
		  
		  Var b As Double = c2 * exp( ( -z ) * ( z / 2.0 ) )
		  
		  Var n As Double = (((( b5 * t + b4 ) * t + b3) * t + b2) * t + b1) * t
		  
		  n = 1.0 - b * n
		  
		  If z < 0.0 Then n = 1 - n
		  
		  Return n
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Random_Simple() As Double
		  'Main_Window.Header_Panel_Container.General_Information.random_seed = _
		  '16807 * Main_Window.Header_Panel_Container.General_Information.random_seed Mod 2147483647
		  '
		  'Return Main_Window.Header_Panel_Container.General_Information.random_seed * 4.6566128752459E-10
		  
		  
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
