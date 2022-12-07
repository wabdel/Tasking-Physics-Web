#tag WebContainerControl
Begin WebContainer WEBCONTAINER_Replans_PieChart
   Compatibility   =   ""
   ControlID       =   ""
   Enabled         =   True
   Height          =   500
   Indicator       =   0
   LayoutDirection =   0
   LayoutType      =   0
   Left            =   0
   LockBottom      =   False
   LockHorizontal  =   False
   LockLeft        =   True
   LockRight       =   False
   LockTop         =   True
   LockVertical    =   False
   ScrollDirection =   0
   TabIndex        =   0
   Top             =   0
   Visible         =   True
   Width           =   500
   _mDesignHeight  =   0
   _mDesignWidth   =   0
   _mName          =   ""
   _mPanelIndex    =   -1
   Begin WebChart Replan_WebChart
      ControlID       =   ""
      DatasetCount    =   0
      Enabled         =   True
      HasAnimation    =   False
      HasLegend       =   False
      Height          =   500
      Index           =   -2147483648
      Indicator       =   ""
      Left            =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      Mode            =   3
      Scope           =   2
      TabIndex        =   0
      Title           =   ""
      Tooltip         =   ""
      Top             =   0
      Visible         =   True
      Width           =   500
      _mMode          =   ""
      _mPanelIndex    =   -1
   End
End
#tag EndWebContainerControl

#tag WindowCode
	#tag Event
		Sub Shown()
		  Replan_WebChart.Left = 0
		  Replan_WebChart.Top = 0
		  Replan_WebChart.Width = Self.Width
		  Replan_WebChart.Height = Self.Height
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub POPULATE_Replan_WebCHart(d as DateTime, type as String)
		  Var sql As String
		  
		  Select Case type
		  Case "year"
		    
		    sql = "SELECT COUNT(*) as total, " _
		    + "SUM(is_replan)  AS condition_true " _
		    + "FROM physics_tasking.plans " _
		    + "WHERE is_completed = TRUE " _
		    + "AND YEAR(due_date) = " + d.Year.ToString + ";"
		    
		    
		  Case "quarter"
		    
		    Var q As String
		    
		    Select Case d.Month
		    Case 1 To 3
		      
		      q = "1, 2, 3"
		      
		    Case 4 To 6
		      
		      q = "4, 5, 6"
		      
		    Case 7 To 9
		      
		      q = "7, 8, 9"
		      
		    Case 10 To 12
		      
		      q = "10, 11, 12"
		      
		      
		    End Select
		    
		    sql = "SELECT COUNT(*) as total, " _
		    + "SUM(is_replan)  AS condition_true " _
		    + "FROM physics_tasking.plans " _
		    + "WHERE is_completed = TRUE " _
		    + "AND YEAR(due_date) = " + d.Year.ToString + " " _
		    + "AND MONTH(due_date) IN (" + q + ");"
		    
		    
		  Case "month"
		    
		    sql = "SELECT COUNT(*) as total, " _
		    + "SUM(is_replan)  AS condition_true " _
		    + "FROM physics_tasking.plans " _
		    + "WHERE is_completed = TRUE " _
		    + "AND YEAR(due_date) = " + d.Year.ToString + " " _
		    + "AND MONTH(due_date) = " + d.Month.ToString + ";"
		    
		    
		  End Select
		  
		  Var rs As RowSet = Physics_Tasking.DB_SELECT_Statement( sql)
		  
		  Var data() As Double
		  Var colors() As Color
		  Var labels() As String
		  Replan_WebChart.RemoveAllDatasets
		  Replan_WebChart.RemoveAllLabels
		  
		  data.Add( rs.Column("total").IntegerValue - rs.Column("condition_true").IntegerValue)
		  Colors.Add( Color.Red)
		  labels.Add( "regular")
		  data.Add( rs.Column("condition_true").IntegerValue)
		  labels.Add( "replan")
		  Colors.Add( Color.Blue)
		  
		  Var mySet As New WebChartCircularDataset("Replans", data, colors)
		  Replan_WebChart.AddDataset(mySet)
		  Replan_WebChart.AddLabels(labels)
		  
		  
		  
		  
		End Sub
	#tag EndMethod


#tag EndWindowCode

#tag Events Replan_WebChart
	#tag Event
		Sub Opening()
		  ME.Style.BackgroundColor = Color.White
		End Sub
	#tag EndEvent
	#tag Event
		Sub OverrideOptions(Options as JSONItem)
		  Var legend As New JSONItem
		  legend.Value("display") = True
		  
		  
		  'title.Value("fontSize") = 24
		  Options.Value("legend") = legend
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="_mPanelIndex"
		Visible=false
		Group="Behavior"
		InitialValue="-1"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Name"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
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
		Name="ControlID"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Enabled"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockBottom"
		Visible=true
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockHorizontal"
		Visible=true
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockLeft"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockRight"
		Visible=true
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockTop"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockVertical"
		Visible=true
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="Behavior"
		InitialValue=""
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="_mDesignHeight"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="_mDesignWidth"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="_mName"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="ScrollDirection"
		Visible=true
		Group="Behavior"
		InitialValue="ScrollDirections.None"
		Type="WebContainer.ScrollDirections"
		EditorType="Enum"
		#tag EnumValues
			"0 - None"
			"1 - Horizontal"
			"2 - Vertical"
			"3 - Both"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabIndex"
		Visible=true
		Group="Visual Controls"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Indicator"
		Visible=false
		Group="Visual Controls"
		InitialValue=""
		Type="WebUIControl.Indicators"
		EditorType="Enum"
		#tag EnumValues
			"0 - Default"
			"1 - Primary"
			"2 - Secondary"
			"3 - Success"
			"4 - Danger"
			"5 - Warning"
			"6 - Info"
			"7 - Light"
			"8 - Dark"
			"9 - Link"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="LayoutType"
		Visible=true
		Group="View"
		InitialValue="LayoutTypes.Fixed"
		Type="LayoutTypes"
		EditorType="Enum"
		#tag EnumValues
			"0 - Fixed"
			"1 - Flex"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="LayoutDirection"
		Visible=true
		Group="View"
		InitialValue="LayoutDirections.LeftToRight"
		Type="LayoutDirections"
		EditorType="Enum"
		#tag EnumValues
			"0 - LeftToRight"
			"1 - RightToLeft"
			"2 - TopToBottom"
			"3 - BottomToTop"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="Width"
		Visible=false
		Group=""
		InitialValue="250"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=false
		Group=""
		InitialValue="250"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
