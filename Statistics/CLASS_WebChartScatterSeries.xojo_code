#tag Class
Protected Class CLASS_WebChartScatterSeries
	#tag Method, Flags = &h0
		Sub ADD_Point(x as Double, y as Double)
		  Var temp As  New WebChartScatterDatapoint(1,  1, 10)
		  
		  temp.x = x
		  temp.y =  y
		  temp.Radius = 10
		  
		  myset.AddDatapoint(temp)
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(c as Color, initals as String)
		  myset = New WebChartScatterDataset( c, points)
		  myset.Label = initals
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		label As String
	#tag EndProperty

	#tag Property, Flags = &h0
		myset As WebChartScatterDataset
	#tag EndProperty

	#tag Property, Flags = &h0
		points() As WebChartScatterDatapoint
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
			Name="label"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
