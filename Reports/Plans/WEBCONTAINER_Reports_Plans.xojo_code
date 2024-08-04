#tag WebContainerControl
Begin WebContainer WEBCONTAINER_Reports_Plans
   Compatibility   =   ""
   ControlCount    =   0
   ControlID       =   ""
   Enabled         =   True
   Height          =   600
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
   PanelIndex      =   0
   ScrollDirection =   0
   TabIndex        =   0
   Top             =   0
   Visible         =   True
   Width           =   1240
   _mDesignHeight  =   0
   _mDesignWidth   =   0
   _mPanelIndex    =   -1
   Begin WebChart Plans_Chart
      AllowPopover    =   True
      AutoCalculateYAxis=   False
      ControlID       =   ""
      DatasetCount    =   0
      DatasetLastIndex=   0
      Enabled         =   True
      GridColor       =   &c000000AA
      HasAnimation    =   False
      HasLegend       =   False
      Height          =   500
      Index           =   -2147483648
      Indicator       =   0
      IsGridVisible   =   False
      IsXAxisVisible  =   False
      IsYAxisVisible  =   False
      LabelCount      =   0
      LabelLastIndex  =   0
      Left            =   20
      LegendColor     =   &c000000
      LegendFontName  =   ""
      LegendFontSize  =   0.0
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      Mode            =   1
      PanelIndex      =   0
      PopoverBackgroundColor=   &c000000
      Scope           =   2
      TabIndex        =   0
      TabStop         =   True
      Title           =   ""
      TitleColor      =   &c000000
      TitleFontName   =   ""
      TitleFontSize   =   0.0
      Tooltip         =   ""
      Top             =   80
      Visible         =   True
      Width           =   1200
      _mMode          =   0
      _mPanelIndex    =   -1
   End
   Begin WebRadioGroup Period_RadioGroup
      ControlID       =   ""
      Enabled         =   True
      Height          =   60
      Horizontal      =   True
      Index           =   -2147483648
      Indicator       =   ""
      InitialValue    =   "Yearly\nQuarterly\nMonthly\nWeekly"
      Left            =   447
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      PanelIndex      =   0
      Scope           =   2
      SelectedIndex   =   0
      TabIndex        =   1
      TabStop         =   True
      Tooltip         =   ""
      Top             =   12
      Visible         =   True
      Width           =   488
      _mInitialValue  =   "Option 1\rOption 2"
      _mPanelIndex    =   -1
   End
End
#tag EndWebContainerControl

#tag WindowCode
	#tag Event
		Sub Opening()
		  Me.Style.BackgroundColor = Design_Palette.COLOR_Central_Background2
		  
		  
		  POPULATE_Plans_Chart
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Sub POPULATE_Plans_Chart()
		  Var sql As String
		  Var rs As RowSet
		  Var data() As Double
		  Var labels() As String
		  Plans_Chart.RemoveAllDatasets
		  Plans_Chart.RemoveAllLabels
		  
		  Select Case Period_RadioGroup.SelectedItem.Caption
		  Case "Yearly"
		    
		    sql = "SELECT YEAR(assignment_date) AS y, " _
		    + "SUM(physics_tasking.plan_types.no_of_plans) AS s " _
		    + "FROM physics_tasking.plans " _
		    + "INNER JOIN physics_tasking.plan_types USING(plan_type_id) " _
		    + "GROUP BY YEAR(assignment_date) " _
		    + "ORDER by YEAR(assignment_date);"
		    
		    rs = Physics_Tasking.SELECT_Statement( sql)
		    
		    While Not rs.AfterLastRow 
		      
		      data.Add( rs.Column("s").DoubleValue )
		      
		      labels.Add(rs.Column("y").IntegerValue.ToString)
		      
		      rs.MoveToNextRow
		      
		    Wend
		    
		  Case "Quarterly"
		    sql = "SELECT YEAR(assignment_date) AS y, " _
		    + "QUARTER(assignment_date) As q, " _
		    + "SUM(physics_tasking.plan_types.no_of_plans) AS s " _
		    + "FROM physics_tasking.plans " _
		    + "INNER JOIN physics_tasking.plan_types USING(plan_type_id) " _
		    + "GROUP BY QUARTER(assignment_date), YEAR(assignment_date) " _
		    + "ORDER by YEAR(assignment_date), QUARTER(assignment_date);"
		    
		    rs = Physics_Tasking.SELECT_Statement( sql)
		    
		    While Not rs.AfterLastRow 
		      
		      data.Add( rs.Column("s").DoubleValue )
		      
		      labels.Add(rs.Column("y").IntegerValue.ToString + "/Q" _
		      + rs.Column("q").IntegerValue.ToString)
		      
		      rs.MoveToNextRow
		      
		    Wend
		    
		    
		  Case "Monthly"
		    
		    sql = "SELECT YEAR(assignment_date) AS y, " _
		    + "MONTH(assignment_date) AS m, " _
		    + "SUM(physics_tasking.plan_types.no_of_plans) AS s " _
		    + "FROM physics_tasking.plans " _
		    + "INNER JOIN physics_tasking.plan_types USING(plan_type_id) " _
		    + "GROUP BY MONTH(assignment_date), YEAR(assignment_date) " _
		    + "ORDER BY YEAR(assignment_date), MONTH(assignment_date);"
		    
		    rs = Physics_Tasking.SELECT_Statement( sql)
		    
		    While Not rs.AfterLastRow 
		      
		      data.Add( rs.Column("s").DoubleValue )
		      
		      labels.Add(Date_Module.Get_Month_Abbr(rs.Column("m").IntegerValue) _
		      + "/"  + rs.Column("y").IntegerValue.ToString)
		      
		      rs.MoveToNextRow
		      
		    Wend
		    
		  Case "Weekly"
		    
		    sql  = "SELECT YEAR(assignment_date) AS y, " _
		    + "WEEK(assignment_date,0) AS w, " _
		    + "SUM(physics_tasking.plan_types.no_of_plans) AS s " _
		    + "FROM physics_tasking.plans " _
		    + "INNER JOIN physics_tasking.plan_types USING(plan_type_id) " _
		    + "GROUP BY WEEK(assignment_date, 0), YEAR(assignment_date) " _
		    + "ORDER BY YEAR(assignment_date), WEEK(assignment_date,0);"
		    
		    rs = Physics_Tasking.SELECT_Statement( sql)
		    
		    While Not rs.AfterLastRow 
		      
		      data.Add( rs.Column("s").DoubleValue )
		      
		      labels.Add(rs.Column("y").IntegerValue.ToString + "/W" _
		      + rs.Column("w").IntegerValue.ToString)
		      
		      rs.MoveToNextRow
		      
		    Wend
		    
		    
		  End Select
		  
		  
		  Var mySet As New WebChartLinearDataset("Bar Data", &cFF0000, False, data)
		  mySet.ChartType = WebChartLinearDataset.ChartTypes.bar
		  
		  Plans_Chart.AddDataset(mySet)
		  Plans_Chart.AddLabels(labels)
		  
		  'For Each item As Physics_Tasking.CLASS_User_Record In Physics_Tasking.Users
		  '
		  'If item.Group.id = 2 Or item.Group.id = 3 Then
		  '
		  '
		  'Var sql As String = "SELECT YEAR(assignment_date) as y, " _
		  '+ "MONTH(assignment_date) as m, " _
		  '+ "COUNT(*) FROM physics_tasking.plans " _
		  '+ "WHERE user_id = " + item.id.ToString + " " _
		  '+ "GROUP BY MONTH(assignment_date), YEAR(assignment_date) " _
		  '+ "ORDER by YEAR(assignment_date), MONTH(assignment_date);"
		  '
		  'Var rs As RowSet = Physics_Tasking.SELECT_Statement( sql)
		  '
		  'Var data() As Double
		  '
		  'While Not rs.AfterLastRow 
		  '
		  'data.Add( rs.Column("COUNT(*)").DoubleValue )
		  '
		  ''labels.Add(rs.Column("m").IntegerValue.ToString + "/" _
		  ''+ rs.Column("y").IntegerValue.ToString)
		  '
		  'rs.MoveToNextRow
		  '
		  'Wend
		  '
		  'Var r As Color = Color.RGB(System.Random.InRange(0,255), System.Random.InRange(0,255), System.Random.InRange(0,255))
		  'Var mySet As New WebChartLinearDataset("Bar Data", r, True, data)
		  '
		  'Plans_Chart.AddDataset(mySet)
		  '
		  '
		  'End If
		  '
		  'Next item
		  
		  
		  
		  
		  'Var mySet As New WebChartLinearDataset("Bar Data", &cFF0000, True, data)
		  'mySet.ChartType = WebChartLinearDataset.ChartTypes.Bar
		  '
		  '
		  'Plans_Chart.AddDataset(mySet)
		  'Plans_Chart.AddLabels(labels)
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		Series() As CLASS_WebChartScatterSeries
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Untitled As WebChartScatterDatapoint
	#tag EndProperty


#tag EndWindowCode

#tag Events Plans_Chart
	#tag Event
		Sub Opening()
		  
		  Me.Style.BackgroundColor = Color.White
		  
		  
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub OverrideOptions(options As JSONItem)
		  //Format Title
		  Var title As New JSONItem
		  title.Value("display") = True
		  title.Value("text") = "Plans"
		  title.Value("fontSize") = 24
		  Options.Value("title") = title
		  '
		  'Var legend As New JSONItem
		  'legend.Value("display") = True
		  'legend.Value("fontColor") = "rgb(255, 99, 132)"
		  'Options.Value("legend") = legend
		  '
		  '
		  'Var elements As New JSONItem
		  'Var point As New JSONItem
		  'point.Value("display") = True
		  'point.Value("radius") = 3
		  'elements.Value("point") = point
		  'Options.Value("elements") = elements
		  '
		  //Format Axis
		  Var injectionyAxes As New JSONItem
		  Var injectionxAxes As New JSONItem
		  Var injectionScales As New JSONItem
		  '
		  '//Format yAxis
		  Var injectionyValue As New JSONItem
		  Var injectionyTicks As New JSONItem
		  Var injectionyTitle As New JSONItem
		  Var injectionyScaleLabel As New JSONItem
		  '
		  '
		  '
		  injectionyValue.value("min") = 0
		  injectionyTicks.value("ticks") = injectionyValue
		  '
		  '
		  injectionyTitle.Value("display") = True
		  injectionyTitle.Value("labelString") =  "No. of plans"
		  injectionyTitle.Value("fontSize") = 20
		  '
		  injectionyTicks.Value("scaleLabel") = injectionyTitle
		  '
		  injectionyAxes.add injectionyTicks
		  injectionScales.value("yAxes") = injectionyAxes
		  '
		  '
		  ''//Format xAxis
		  '
		  'Var injectionxValue As New JSONItem
		  'Var injectionxType As New JSONItem
		  'Var injectionxTime As New JSONItem
		  'Var injectionxMonth As New JSONItem
		  'Var injectionxDisplayFormats As New JSONItem
		  'Var injectionxTicks As New JSONItem
		  'Var injectionxTitle As New JSONItem
		  'Var injectionxScaleLabel As New JSONItem
		  '
		  'injectionxTicks.value("type") = "time"
		  '
		  'injectionxMonth.Value("second") =  "DD MMM YYYY"
		  'injectionxDisplayFormats.Value("unit") = "second"
		  'injectionxDisplayFormats.Value("displayFormats") = injectionxMonth
		  '
		  'injectionxTicks.Value("time") = injectionxDisplayFormats
		  '
		  'injectionxTitle.Value("display") = True
		  'injectionxTitle.Value("labelString") =  "Date"
		  'injectionxTitle.Value("fontSize") = 20
		  'injectionxTicks.Value("scaleLabel") = injectionxTitle
		  'injectionxTicks.value("distribution") = "linear"
		  'injectionxAxes.add injectionxTicks
		  'injectionScales.value("xAxes") = injectionxAxes
		  '
		  '
		  options.value("scales") = injectionScales
		  ''System.DebugLog(Options.ToString)
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Period_RadioGroup
	#tag Event
		Sub SelectionChanged(button As WebRadioButton)
		  POPULATE_Plans_Chart
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="PanelIndex"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="ControlCount"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
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
