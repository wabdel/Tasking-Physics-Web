#tag WebContainerControl
Begin WebContainer WEBCONTAINER_Planner_Stats
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
   Begin WebPopupMenu PopupMenu_Planners
      ControlID       =   ""
      Enabled         =   True
      Height          =   38
      Index           =   -2147483648
      Indicator       =   0
      InitialValue    =   ""
      LastAddedRowIndex=   0
      LastRowIndex    =   0
      Left            =   128
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      PanelIndex      =   0
      RowCount        =   0
      Scope           =   2
      SelectedRowIndex=   0
      SelectedRowText =   ""
      TabIndex        =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   20
      Visible         =   True
      Width           =   273
      _mPanelIndex    =   -1
   End
   Begin WebLabel LABEL_Planner
      Bold            =   False
      ControlID       =   ""
      Enabled         =   True
      FontName        =   ""
      FontSize        =   0.0
      Height          =   38
      Index           =   -2147483648
      Indicator       =   0
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      Multiline       =   False
      PanelIndex      =   0
      Scope           =   2
      TabIndex        =   1
      TabStop         =   True
      Text            =   "Planner : "
      TextAlignment   =   3
      TextColor       =   &c000000FF
      Tooltip         =   ""
      Top             =   20
      Underline       =   False
      Visible         =   True
      Width           =   100
      _mPanelIndex    =   -1
   End
   Begin WebChart WebChart_User_Points
      AllowPopover    =   True
      AutoCalculateYAxis=   False
      ControlID       =   ""
      DatasetCount    =   0
      DatasetLastIndex=   0
      Enabled         =   True
      GridColor       =   &c000000AA
      HasAnimation    =   False
      HasLegend       =   True
      Height          =   300
      Index           =   -2147483648
      Indicator       =   0
      IsGridVisible   =   False
      IsXAxisVisible  =   False
      IsYAxisVisible  =   False
      LabelCount      =   0
      LabelLastIndex  =   0
      Left            =   44
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
      Mode            =   0
      PanelIndex      =   0
      PopoverBackgroundColor=   &c000000
      Scope           =   2
      TabIndex        =   2
      TabStop         =   True
      Title           =   ""
      TitleColor      =   &c000000
      TitleFontName   =   ""
      TitleFontSize   =   0.0
      Tooltip         =   ""
      Top             =   92
      Visible         =   True
      Width           =   400
      _mMode          =   0
      _mPanelIndex    =   -1
   End
   Begin WebThread WebThread_Populate_WebChart_User_Points
      DebugIdentifier =   ""
      Enabled         =   True
      Index           =   -2147483648
      LockedInPosition=   False
      Priority        =   5
      Scope           =   2
      StackSize       =   0
      ThreadID        =   0
      ThreadState     =   0
   End
   Begin WebTabPanel WebTabPanel_Planner_Stats
      ControlCount    =   0
      ControlID       =   ""
      Enabled         =   True
      HasBorder       =   True
      Height          =   560
      Index           =   -2147483648
      Indicator       =   ""
      LayoutDirection =   0
      LayoutType      =   0
      Left            =   479
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      PanelCount      =   2
      PanelIndex      =   0
      Scope           =   2
      SelectedPanelIndex=   1
      TabDefinition   =   "Plans\rTasks\rAssigned tasks"
      TabIndex        =   8
      TabStop         =   True
      Tooltip         =   ""
      Top             =   20
      Visible         =   True
      Width           =   741
      _mDesignHeight  =   0
      _mDesignWidth   =   0
      _mPanelIndex    =   -1
      Begin WebListBox WebListBox_Tasks
         ColumnCount     =   3
         ColumnWidths    =   ""
         ControlID       =   ""
         DefaultRowHeight=   49
         Enabled         =   True
         GridLineStyle   =   3
         HasBorder       =   True
         HasHeader       =   True
         HeaderHeight    =   0
         Height          =   440
         HighlightSortedColumn=   True
         Index           =   -2147483648
         Indicator       =   0
         InitialParent   =   "WebTabPanel_Planner_Stats"
         InitialValue    =   "Task	Count; Points"
         LastAddedRowIndex=   0
         LastColumnIndex =   0
         LastRowIndex    =   0
         Left            =   509
         LockBottom      =   False
         LockedInPosition=   False
         LockHorizontal  =   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         LockVertical    =   False
         NoRowsMessage   =   ""
         PanelIndex      =   1
         Parent          =   "WebTabPanel_Planner_Stats"
         ProcessingMessage=   ""
         RowCount        =   0
         RowSelectionType=   1
         Scope           =   2
         SearchCriteria  =   ""
         SelectedRowColor=   &c0d6efd
         SelectedRowIndex=   0
         TabIndex        =   0
         TabPanelIndex   =   0
         TabStop         =   True
         Tooltip         =   ""
         Top             =   74
         Visible         =   True
         Width           =   691
         _mPanelIndex    =   -1
      End
      Begin WebLabel WebLabel_Task_Points
         Bold            =   True
         ControlID       =   ""
         Enabled         =   True
         FontName        =   ""
         FontSize        =   0.0
         Height          =   38
         Index           =   -2147483648
         Indicator       =   0
         InitialParent   =   "WebTabPanel_Planner_Stats"
         Italic          =   False
         Left            =   1043
         LockBottom      =   False
         LockedInPosition=   False
         LockHorizontal  =   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         LockVertical    =   False
         Multiline       =   False
         PanelIndex      =   1
         Parent          =   "WebTabPanel_Planner_Stats"
         Scope           =   2
         TabIndex        =   0
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   "Total = 0.00"
         TextAlignment   =   3
         TextColor       =   &c000000FF
         Tooltip         =   ""
         Top             =   522
         Underline       =   False
         Visible         =   True
         Width           =   157
         _mPanelIndex    =   -1
      End
      Begin WebListBox WebListBox_Plans
         ColumnCount     =   1
         ColumnWidths    =   ""
         ControlID       =   ""
         DefaultRowHeight=   49
         Enabled         =   True
         GridLineStyle   =   3
         HasBorder       =   True
         HasHeader       =   True
         HeaderHeight    =   0
         Height          =   440
         HighlightSortedColumn=   True
         Index           =   -2147483648
         Indicator       =   0
         InitialParent   =   "WebTabPanel_Planner_Stats"
         InitialValue    =   ""
         LastAddedRowIndex=   0
         LastColumnIndex =   0
         LastRowIndex    =   0
         Left            =   509
         LockBottom      =   False
         LockedInPosition=   False
         LockHorizontal  =   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         LockVertical    =   False
         NoRowsMessage   =   ""
         PanelIndex      =   0
         Parent          =   "WebTabPanel_Planner_Stats"
         ProcessingMessage=   ""
         RowCount        =   0
         RowSelectionType=   1
         Scope           =   2
         SearchCriteria  =   ""
         SelectedRowColor=   &c0d6efd
         SelectedRowIndex=   0
         TabIndex        =   1
         TabPanelIndex   =   0
         TabStop         =   True
         Tooltip         =   ""
         Top             =   74
         Visible         =   True
         Width           =   691
         _mPanelIndex    =   -1
      End
      Begin WebLabel WebLabel_Plan_Points
         Bold            =   False
         ControlID       =   ""
         Enabled         =   True
         FontName        =   ""
         FontSize        =   0.0
         Height          =   38
         Index           =   -2147483648
         Indicator       =   0
         InitialParent   =   "WebTabPanel_Planner_Stats"
         Italic          =   False
         Left            =   1100
         LockBottom      =   False
         LockedInPosition=   False
         LockHorizontal  =   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         LockVertical    =   False
         Multiline       =   False
         PanelIndex      =   0
         Parent          =   "WebTabPanel_Planner_Stats"
         Scope           =   2
         TabIndex        =   1
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   "Total = 0.00"
         TextAlignment   =   3
         TextColor       =   &c000000FF
         Tooltip         =   ""
         Top             =   522
         Underline       =   False
         Visible         =   True
         Width           =   100
         _mPanelIndex    =   -1
      End
   End
End
#tag EndWebContainerControl

#tag WindowCode
	#tag Event
		Sub Opening()
		  Me.Style.BackgroundColor = Design_Palette.COLOR_Central_Background2
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Sub POPULATE_Tasks_ListBox()
		  WebListBox_Tasks.RemoveAllRows
		  Var d As DateTime = DateTime.Now.SubtractInterval(1,0.0)
		  
		  
		  Var sql As String = "SELECT name, SUM(multiplier) as m, SUM(multiplier*weight) as p " _
		  + "FROM physics_tasking.tasks " _
		  + "INNER JOIN physics_tasking.task_types USING(task_type_id) " _
		  + "WHERE physics_tasking.tasks.user_id = " + Planner.id.ToString + " " _
		  + "AND DATE(physics_tasking.tasks.completion_date) >= '"  + d.SQLDate + "'" _
		  + "GROUP BY name " _
		  + "ORDER BY name;"
		  
		  Var rs As RowSet = Physics_Tasking.SELECT_Statement(sql)
		  
		  
		  Var sum As Double = 0
		  While Not  rs.AfterLastRow
		    
		    WebListBox_Tasks.AddRow()
		    WebListBox_Tasks.CellTextAt( WebListBox_Tasks.LastAddedRowIndex, 0) = rs.Column("name").StringValue
		    WebListBox_Tasks.CellTextAt( WebListBox_Tasks.LastAddedRowIndex, 1) = rs.Column("m").IntegerValue.ToString
		    WebListBox_Tasks.CellTextAt( WebListBox_Tasks.LastAddedRowIndex, 2) =Format(rs.Column("p").DoubleValue,"0.00")
		    
		    sum = sum + rs.Column("p").DoubleValue
		    
		    rs.MoveToNextRow
		    
		  Wend
		  
		  WebLabel_Task_Points.Text = "Total = " + Format(sum, "0.00")
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private Planner As Physics_Tasking.CLASS_User_Record
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Series() As CLASS_WebChartLinear
	#tag EndProperty


#tag EndWindowCode

#tag Events PopupMenu_Planners
	#tag Event
		Sub Opening()
		  Me.RemoveAllRows
		  
		  Var sql as string = "SELECT user_id, first_name, family_name FROM physics_tasking.users " _
		  + "WHERE category_id IN(2,3) " _
		  + "AND is_retired = FALSE;"
		  Var rs As RowSet = Physics_Tasking.SELECT_Statement(sql)
		  
		  While Not rs.AfterLastRow
		    
		    Me.AddRow( rs.Column("first_name").StringValue.Trim.Titlecase + " " _
		    + rs.Column("family_name").StringValue.Trim.Uppercase)
		    Me.RowTagAt( Me.LastAddedRowIndex) = rs.Column("user_id").IntegerValue
		    
		    
		    rs.MoveToNextRow
		    
		  Wend
		End Sub
	#tag EndEvent
	#tag Event
		Sub SelectionChanged(item As WebMenuItem)
		  WebThread_Populate_WebChart_User_Points.Stop
		  
		  WebChart_User_Points.RemoveAllDatasets
		  
		  Series.ResizeTo(-1)
		  
		  Planner = New Physics_Tasking.CLASS_User_Record
		  Planner.id = Me.RowTagAt( Me.SelectedRowIndex)
		  POPULATE_Tasks_ListBox
		  
		  WebThread_Populate_WebChart_User_Points.Start
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events LABEL_Planner
	#tag Event
		Sub Opening()
		  Me.TextColor = Color.White
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events WebChart_User_Points
	#tag Event
		Sub Opening()
		  Me.HasLegend = True
		  Me.HasAnimation = False
		  Me.Style.BackgroundColor = Color.White
		  
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub OverrideOptions(options As JSONItem)
		  '//Format Title
		  Var title As New JSONItem
		  title.Value("display") = True
		  title.Value("text") = "Points"
		  title.Value("fontSize") = 24
		  Options.Value("title") = title
		  
		  Var legend As New JSONItem
		  legend.Value("display") = True
		  legend.Value("fontColor") = "rgb(255, 99, 132)"
		  Options.Value("legend") = legend
		  
		  
		  'Var elements As New JSONItem
		  'Var point As New JSONItem
		  'point.Value("display") = True
		  'point.Value("radius") = 3
		  'elements.Value("point") = point
		  'Options.Value("elements") = elements
		  '
		  '//Format Axis
		  'Var injectionyAxes As New JSONItem
		  ''Var injectionxAxes As New JSONItem
		  'Var injectionScales As New JSONItem
		  '
		  ''//Format yAxis
		  'Var injectionyValue As New JSONItem
		  'Var injectionyTicks As New JSONItem
		  'Var injectionyTitle As New JSONItem
		  'Var injectionyScaleLabel As New JSONItem
		  '
		  '
		  '
		  'injectionyValue.value("min") = 0
		  'injectionyTicks.value("ticks") = injectionyValue
		  '
		  '
		  'injectionyTitle.Value("display") = True
		  'injectionyTitle.Value("labelString") =  "Points"
		  'injectionyTitle.Value("fontSize") = 20
		  '
		  'injectionyTicks.Value("scaleLabel") = injectionyTitle
		  '
		  'injectionyAxes.add injectionyTicks
		  'injectionScales.value("yAxes") = injectionyAxes
		  
		  
		  '//Format xAxis
		  
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
		  
		  
		  'options.value("scales") = injectionScales
		  'System.DebugLog(Options.ToString)
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events WebThread_Populate_WebChart_User_Points
	#tag Event
		Sub Run()
		  Var d As DateTime = DateTime.Now.SubtractInterval(1,0.0)
		  
		  Var Today As New DateTime(DateTime.Now.Year, DateTime.Now.Month, DateTime.Now.Day)
		  
		  Series.ResizeTo(-1)
		  Series.Add( New CLASS_WebChartLinear("Plan_Points", Color.blue))
		  Series( Series.LastIndex).myset.ChartType = WebChartLinearDataset.ChartTypes.Line
		  Series( Series.LastIndex).label = "Plan points"
		  WebChart_User_Points.AddDataset( Series( Series.LastIndex).myset)
		  
		  Series.Add( New CLASS_WebChartLinear("Task_Points", Color.red))
		  Series( Series.LastIndex).myset.ChartType = WebChartLinearDataset.ChartTypes.Line
		  Series( Series.LastIndex).label = "Task points"
		  WebChart_User_Points.AddDataset( Series( Series.LastIndex).myset)
		  
		  Series.Add( New CLASS_WebChartLinear("Assigned_Task_Points", Color.Green))
		  Series( Series.LastIndex).myset.ChartType = WebChartLinearDataset.ChartTypes.Line
		  Series( Series.LastIndex).label = "Assigned task points"
		  WebChart_User_Points.AddDataset( Series( Series.LastIndex).myset)
		  'Var c_index As Integer = 0
		  'For Each item As Physics_Tasking.CLASS_User_Record In Planner
		  'If (item.Group.id = 2 Or item.Group.id = 3) Then
		  '
		  ''Var r As Integer = System.Random.InRange(0,255)
		  ''Var g As Integer = System.Random.InRange(0,255)
		  ''Var b As Integer = System.Random.InRange(0,255)
		  'Series.Add( New CLASS_WebChartLinear(item.initials, App.Color_Set(c_index)))
		  'Series( Series.LastIndex).myset.ChartType = WebChartLinearDataset.ChartTypes.Line
		  '
		  '
		  'Points_Chart.AddDataset( Series( Series.LastIndex).myset)
		  'c_index = c_index + 1
		  '
		  '
		  'End If
		  'Next item
		  
		  While d <= Today
		    
		    Series(0).ADD_Point(Planner.GET_Accumulated_Plan_Points(d))
		    Series(1).ADD_Point(Planner.GET_Accumulated_Task_Points(d))
		    Series(2).ADD_Point(Planner.GET_Accumulated_Assigned_Task_Points(d))
		    WebChart_User_Points.AddLabel( d.Day.ToString + "/" + d.Month.ToString + "/" + d.Year.ToString)
		    d = d.AddInterval(0,0,1)
		    
		    Me.AddUserInterfaceUpdate("UIProgress":Series(0).points.Count)
		    
		  Wend
		  
		  'While d <= Today
		  '
		  'For Each s As CLASS_WebChartLinear In Series
		  'For i As Integer = 0 To Planner.LastIndex
		  '
		  'If s.myset.Label = Planner(i).initials Then
		  '
		  '
		  'Var points As Double = Planner(i).GET_Accumulated_Plan_Points(d) _
		  '+ Planner(i).GET_Accumulated_Task_Points(d)  _
		  '+ Planner(i).GET_Accumulated_Assigned_Task_Points(d)
		  '
		  's.ADD_Point(points)
		  '
		  'Exit For i
		  '
		  'End If
		  '
		  '
		  '
		  'Next i
		  '
		  'Next s
		  '
		  '
		  '
		  'Points_Chart.AddLabel( d.Day.ToString + "/" + d.Month.ToString + "/" + d.Year.ToString)
		  '
		  'd = d.AddInterval(0,0,1)
		  '
		  '
		  'Me.AddUserInterfaceUpdate("UIProgress":Series(0).points.Count)
		  'Wend
		  
		  
		  Me.AddUserInterfaceUpdate("Finished":True)
		End Sub
	#tag EndEvent
	#tag Event
		Sub UserInterfaceUpdate(data() As Dictionary)
		  For Each arg As Dictionary In data
		    If arg.HasKey("UIProgress") Then
		      
		      For i As Integer = 0 To WebChart_User_Points.DatasetCount - 1
		        
		        
		        
		        
		        WebChart_User_Points.DatasetAt(i) = Series(i).myset
		        
		      Next i
		    End If
		  Next
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events WebListBox_Tasks
	#tag Event
		Sub Opening()
		  Me.ColumnCount = 3
		  Me.HeaderAt(0) = "Tast"
		  Me.HeaderAt(1) = "Count"
		  Me.HeaderAt(2) = "Points"
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events WebLabel_Task_Points
	#tag Event
		Sub Opening()
		  Me.TextColor = Color.White
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
		Name="_mPanelIndex"
		Visible=false
		Group="Behavior"
		InitialValue="-1"
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
