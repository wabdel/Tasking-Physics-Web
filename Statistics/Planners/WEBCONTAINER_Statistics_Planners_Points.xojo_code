#tag WebContainerControl
Begin WebContainer WEBCONTAINER_Statistics_Planners_Points
   Compatibility   =   ""
   ControlCount    =   0
   ControlID       =   ""
   Enabled         =   True
   Height          =   786
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
   Width           =   1220
   _mDesignHeight  =   0
   _mDesignWidth   =   0
   _mPanelIndex    =   -1
   Begin WebListBox Planner_Total_Points_ListBox
      ColumnCount     =   1
      ColumnWidths    =   ""
      ControlID       =   ""
      DefaultRowHeight=   49
      Enabled         =   True
      GridLineStyle   =   3
      HasBorder       =   True
      HasHeader       =   False
      HeaderHeight    =   0
      Height          =   725
      HighlightSortedColumn=   True
      Index           =   -2147483648
      Indicator       =   ""
      InitialValue    =   ""
      LastAddedRowIndex=   0
      LastColumnIndex =   0
      LastRowIndex    =   0
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      NoRowsMessage   =   ""
      PanelIndex      =   0
      ProcessingMessage=   ""
      RowCount        =   0
      RowSelectionType=   1
      Scope           =   2
      SearchCriteria  =   ""
      SelectedRowColor=   &c0272D300
      SelectedRowIndex=   0
      TabIndex        =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   41
      Visible         =   True
      Width           =   642
      _mPanelIndex    =   -1
   End
   Begin WebChart Points_Chart
      AllowPopover    =   True
      AutoCalculateYAxis=   False
      ControlID       =   ""
      DatasetCount    =   0
      DatasetLastIndex=   0
      Enabled         =   True
      GridColor       =   &c000000AA
      HasAnimation    =   False
      HasLegend       =   False
      Height          =   367
      Index           =   -2147483648
      Indicator       =   ""
      IsGridVisible   =   False
      IsXAxisVisible  =   False
      IsYAxisVisible  =   False
      LabelCount      =   0
      LabelLastIndex  =   0
      Left            =   670
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
      TabIndex        =   1
      TabStop         =   True
      Title           =   ""
      TitleColor      =   &c000000
      TitleFontName   =   ""
      TitleFontSize   =   0.0
      Tooltip         =   ""
      Top             =   209
      Visible         =   True
      Width           =   530
      _mMode          =   ""
      _mPanelIndex    =   -1
   End
   Begin WebThread Populate_Chart_Thread
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
End
#tag EndWebContainerControl

#tag WindowCode
	#tag Event
		Sub Opening()
		  Me.Style.BackgroundColor = Design_Palette.COLOR_Surface_Primary
		  
		  POPULATE_Planners
		  Populate_Chart_Thread.Start
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Sub POPULATE_Planners()
		  Planner.ResizeTo(-1)
		  
		  Var sql As String ="SELECT user_id FROM points"
		  
		  Var rs As RowSet = Physics_Tasking.SELECT_Statement(sql)
		  
		  
		  While Not rs.AfterLastRow
		    
		    Planner.Add( New Physics_Tasking.CLASS_User_Record)
		    Planner( Planner.LastIndex).id = rs.Column("user_id").IntegerValue
		    
		    rs.MoveToNextRow
		  Wend
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private Planner() As Physics_Tasking.CLASS_User_Record
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Series() As CLASS_WebChartLinear
	#tag EndProperty


#tag EndWindowCode

#tag Events Planner_Total_Points_ListBox
	#tag Event
		Sub Opening()
		  Me.Style.BackgroundColor = Design_Palette.COLOR_Surface_Secondary
		  Me.HasHeader = True
		  Me.RowSelectionType = WebListBox.RowSelectionTypes.None
		  Me.DataSource = New PlannersAnnualPointsDataSource
		  Me.ReloadData
		  'Latest_UPDATE = App.last_database_update
		  'REFRESH_Timer.RunMode = WebTimer.RunModes.Multiple
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Points_Chart
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
	#tag Event
		Sub Opening()
		  Me.HasLegend = True
		  Me.HasAnimation = False
		  Me.Style.BackgroundColor = Color.White
		  
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Populate_Chart_Thread
	#tag Event
		Sub Run()
		  Var d As DateTime = DateTime.Now.SubtractInterval(1,0.0)
		  
		  Var Today As New DateTime(DateTime.Now.Year, DateTime.Now.Month, DateTime.Now.Day)
		  
		  Series.ResizeTo(-1)
		  Var c_index As Integer = 0
		  For Each item As Physics_Tasking.CLASS_User_Record In Planner
		    If (item.Group.id = 2 Or item.Group.id = 3) Then
		      
		      'Var r As Integer = System.Random.InRange(0,255)
		      'Var g As Integer = System.Random.InRange(0,255)
		      'Var b As Integer = System.Random.InRange(0,255)
		      Series.Add( New CLASS_WebChartLinear(item.initials, App.Color_Set(c_index)))
		      Series( Series.LastIndex).myset.ChartType = WebChartLinearDataset.ChartTypes.Line
		      
		      
		      Points_Chart.AddDataset( Series( Series.LastIndex).myset)
		      c_index = c_index + 1
		      
		      
		    End If
		  Next item
		  
		  Var j As Integer
		  
		  
		  While d <= Today
		    
		    For Each s As CLASS_WebChartLinear In Series
		      For i As Integer = 0 To Planner.LastIndex
		        
		        If s.myset.Label = Planner(i).initials Then
		          
		          
		          Var points As Double = Planner(i).GET_Accumulated_Plan_Points(d) _
		          + Planner(i).GET_Accumulated_Task_Points(d)  _
		          + Planner(i).GET_Accumulated_Assigned_Task_Points(d)
		          
		          s.ADD_Point(points)
		          
		          Exit For i
		          
		        End If
		        
		        
		        
		      Next i
		      
		    Next s
		    
		    
		    
		    Points_Chart.AddLabel( d.Day.ToString + "/" + d.Month.ToString + "/" + d.Year.ToString)
		    
		    d = d.AddInterval(0,0,1)
		    
		    
		    Me.AddUserInterfaceUpdate("UIProgress":Series(0).points.Count)
		  Wend
		  
		  
		  Me.AddUserInterfaceUpdate("Finished":True)
		End Sub
	#tag EndEvent
	#tag Event
		Sub UserInterfaceUpdate(data() As Dictionary)
		  For Each arg As Dictionary In data
		    If arg.HasKey("UIProgress") Then
		      
		      For i As Integer = 0 To Points_Chart.DatasetCount - 1
		        
		        
		        
		        
		        Points_Chart.DatasetAt(i) = Series(i).myset
		        
		      Next i
		    End If
		  Next
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
