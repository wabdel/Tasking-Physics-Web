#tag WebContainerControl
Begin WebContainer WEBCONTAINER_Statistics_Points_History
   Compatibility   =   ""
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
   ScrollDirection =   0
   TabIndex        =   0
   Top             =   0
   Visible         =   True
   Width           =   1240
   _mDesignHeight  =   0
   _mDesignWidth   =   0
   _mPanelIndex    =   -1
   Begin WebChart Points_Chart
      ControlID       =   ""
      DatasetCount    =   0
      Enabled         =   True
      HasAnimation    =   False
      HasLegend       =   False
      Height          =   560
      Index           =   -2147483648
      Indicator       =   0
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      Mode            =   0
      Scope           =   2
      TabIndex        =   0
      Title           =   ""
      Tooltip         =   ""
      Top             =   20
      Visible         =   True
      Width           =   1200
      _mMode          =   0
      _mPanelIndex    =   -1
   End
   Begin WebProgressBar Counter_ProgressBar
      AllowAnimation  =   True
      Caption         =   ""
      ControlID       =   ""
      Enabled         =   True
      Height          =   16
      Indeterminate   =   False
      Index           =   -2147483648
      Indicator       =   0
      Left            =   570
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      MaximumValue    =   100
      Scope           =   2
      TabIndex        =   1
      Tooltip         =   ""
      Top             =   292
      Value           =   50
      Visible         =   False
      Width           =   100
      _mPanelIndex    =   -1
   End
   Begin WebThread Populate_Chart_Thread
      DebugIdentifier =   ""
      Index           =   -2147483648
      LockedInPosition=   False
      Priority        =   5
      Scope           =   2
      StackSize       =   0
      ThreadID        =   0
      ThreadState     =   0
   End
   Begin WebChart Points_Chart_old
      ControlID       =   ""
      DatasetCount    =   0
      Enabled         =   True
      HasAnimation    =   False
      HasLegend       =   False
      Height          =   560
      Index           =   -2147483648
      Indicator       =   0
      Left            =   40
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      Mode            =   7
      Scope           =   2
      TabIndex        =   2
      Title           =   ""
      Tooltip         =   ""
      Top             =   40
      Visible         =   False
      Width           =   1200
      _mMode          =   0
      _mPanelIndex    =   -1
   End
End
#tag EndWebContainerControl

#tag WindowCode
	#tag Event
		Sub Closed()
		  If Populate_Chart_Thread.ThreadState = Thread.ThreadStates.Running Then
		    Populate_Chart_Thread.Stop
		  End If
		End Sub
	#tag EndEvent

	#tag Event
		Sub Opening()
		  Me.Style.BackgroundColor = Session.COLOR_Central_Background2
		  
		  Planner.ResizeTo(-1)
		  Var sql As String = "SELECT user_id FROM users " _
		  + "WHERE category_id IN (2,3) " _
		  + "ORDER BY initials"
		  
		  Var rs As RowSet = Physics_Tasking.DB_SELECT_Statement( sql)
		  
		  While Not rs.AfterLastRow
		    
		    
		    Planner.Add( New Physics_Tasking.CLASS_User_Record)
		    
		    Planner( Planner.LastIndex).id = rs.Column("user_id").IntegerValue
		    
		    
		    
		    rs.MoveToNextRow
		    
		  Wend
		  
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Shown()
		  Var Today As New DateTime(DateTime.Now.Year, DateTime.Now.Month, DateTime.Now.Day)
		  Var temp As New DateTime(2021, 2, 13)
		  Counter_ProgressBar.Value = 0
		  Counter_ProgressBar.MaximumValue = (Today.SecondsFrom1970 - temp.SecondsFrom1970)/(60 * 60 * 24)
		  
		  
		  
		  Counter_ProgressBar.Visible = False
		  
		  Populate_Chart_Thread.Start
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h21
		Private Planner() As Physics_Tasking.CLASS_User_Record
	#tag EndProperty

	#tag Property, Flags = &h0
		Series() As CLASS_WebChartLinear
	#tag EndProperty

	#tag Property, Flags = &h0
		Series_old() As CLASS_WebChartScatterSeries
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Untitled As WebChartScatterDatapoint
	#tag EndProperty


#tag EndWindowCode

#tag Events Points_Chart
	#tag Event
		Sub Opening()
		  Me.Style.BackgroundColor = Color.White
		  
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub OverrideOptions(Options as JSONItem)
		  '//Format Title
		  Var title As New JSONItem
		  title.Value("display") = True
		  title.Value("text") = "Daily distribution points history"
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
#tag Events Populate_Chart_Thread
	#tag Event
		Sub Run()
		  Var sql As String = "SELECT DATE(assignment_date) AS d " _
		  + "FROM physics_tasking.plans " _
		  + "ORDER BY assignment_date ASC " _
		  + "LIMIT 1;"
		  
		  Var rs As RowSet = Physics_Tasking.DB_SELECT_Statement(sql)
		  
		  Var date_found As Boolean = False
		  Var d As DateTime
		  
		  
		  If rs.Column("d").DateTimeValue <> Nil Then 
		    
		    date_found = True
		    d = rs.Column("d").DateTimeValue
		    
		  End If
		  
		  sql = "SELECT DATE(completion_date) AS d " _
		  + "FROM physics_tasking.tasks " _
		  + "ORDER BY completion_date ASC " _
		  + "LIMIT 1;"
		  
		  rs = Physics_Tasking.DB_SELECT_Statement(sql)
		  
		  If rs.Column("d").DateTimeValue <> Nil Then 
		    
		    Select Case date_found
		    Case True
		      
		      If rs.Column("d").DateTimeValue < d Then
		        
		        d = rs.Column("d").DateTimeValue
		        
		      Else
		        
		        d = rs.Column("d").DateTimeValue
		        
		      End If
		    Case False
		      
		      d = rs.Column("d").DateTimeValue
		      
		    End Select
		    
		  End If
		  
		  sql = "SELECT DATE(completion_date) AS d " _
		  + "FROM physics_tasking.scheduled_tasks " _
		  + "ORDER BY completion_date ASC " _
		  + "LIMIT 1;"
		  
		  rs = Physics_Tasking.DB_SELECT_Statement(sql)
		  
		  If rs.Column("d").DateTimeValue <> Nil Then 
		    
		    Select Case date_found
		    Case True
		      
		      If rs.Column("d").DateTimeValue < d Then
		        
		        d = rs.Column("d").DateTimeValue
		        
		      Else
		        
		        d = rs.Column("d").DateTimeValue
		        
		      End If
		    Case False
		      
		      date_found = True
		      d = rs.Column("d").DateTimeValue
		      
		    End Select
		    
		  End If
		  
		  If Not date_found Then
		    
		    d = New DateTime(2021, 2, 13)
		    
		  End If
		  
		  Var Today As New DateTime(DateTime.Now.Year, DateTime.Now.Month, DateTime.Now.Day)
		  
		  Var c() As Color
		  c.Add( Color.RGB(255,0,0))
		  c.Add( Color.RGB(0,255,0))
		  c.Add( Color.RGB(0, 0, 255))
		  c.Add( Color.RGB(255,0,255))
		  c.Add( Color.RGB(0,255, 255))
		  c.Add( Color.RGB(128,0,0))
		  c.Add( Color.RGB(0, 128,0))
		  c.Add( Color.RGB(0, 0, 128))
		  c.Add( Color.RGB(128, 0, 128))
		  c.Add( Color.RGB(0, 128, 128))
		  c.Add( Color.RGB(0, 128, 50))
		  
		  Series.ResizeTo(-1)
		  Var c_index As Integer = 0
		  For Each item As Physics_Tasking.CLASS_User_Record In Planner
		    If (item.Group.id = 2 Or item.Group.id = 3) Then
		      
		      'Var r As Integer = System.Random.InRange(0,255)
		      'Var g As Integer = System.Random.InRange(0,255)
		      'Var b As Integer = System.Random.InRange(0,255)
		      Series.Add( New CLASS_WebChartLinear(item.initials, c(c_index)))
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
		          
		          
		          Var points As Double = Planner(i).GET_Total_Points(d)
		          
		          //If points > 0 Then
		          s.ADD_Point(points)
		          //End If
		          Exit For i
		          
		        End If
		        
		        
		        
		      Next i
		      
		      
		      
		      
		    Next s
		    
		    'For Each item As Physics_Tasking.CLASS_User_Record In Physics_Tasking.Users
		    'If (item.Group.id = 2 Or item.Group.id = 3) Then
		    '
		    'For Each s As CLASS_WebChartLinear In Series
		    'If item.initials = s.myset.Label Then
		    '
		    's.ADD_Point( item.GET_Total_Points( d))
		    '
		    'Exit For s
		    'End If
		    'Next s
		    '
		    '
		    'End If
		    'Next item
		    
		    Points_Chart.AddLabel( d.Day.ToString + "/" + d.Month.ToString + "/" + d.Year.ToString)
		    
		    d = d.AddInterval(0,0,1)
		    
		    
		    Me.AddUserInterfaceUpdate("UIProgress":Series(0).points.Count)
		  Wend
		  
		  
		  Me.AddUserInterfaceUpdate("Finished":True)
		End Sub
	#tag EndEvent
	#tag Event
		Sub UserInterfaceUpdate(data() as Dictionary)
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
#tag Events Points_Chart_old
	#tag Event
		Sub Opening()
		  Me.Style.BackgroundColor = Color.White
		  
		  
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub OverrideOptions(Options as JSONItem)
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
		  
		  
		  Var elements As New JSONItem
		  Var point As New JSONItem
		  point.Value("display") = True
		  point.Value("radius") = 3
		  elements.Value("point") = point
		  Options.Value("elements") = elements
		  
		  //Format Axis
		  Var injectionyAxes As New JSONItem
		  Var injectionxAxes As New JSONItem
		  Var injectionScales As New JSONItem
		  
		  '//Format yAxis
		  Var injectionyValue As New JSONItem
		  Var injectionyTicks As New JSONItem
		  Var injectionyTitle As New JSONItem
		  Var injectionyScaleLabel As New JSONItem
		  
		  
		  
		  injectionyValue.value("min") = 0
		  injectionyTicks.value("ticks") = injectionyValue
		  
		  
		  injectionyTitle.Value("display") = True
		  injectionyTitle.Value("labelString") =  "Points"
		  injectionyTitle.Value("fontSize") = 20
		  
		  injectionyTicks.Value("scaleLabel") = injectionyTitle
		  
		  injectionyAxes.add injectionyTicks
		  injectionScales.value("yAxes") = injectionyAxes
		  
		  
		  '//Format xAxis
		  
		  Var injectionxValue As New JSONItem
		  Var injectionxType As New JSONItem
		  Var injectionxTime As New JSONItem
		  Var injectionxMonth As New JSONItem
		  Var injectionxDisplayFormats As New JSONItem
		  Var injectionxTicks As New JSONItem
		  Var injectionxTitle As New JSONItem
		  Var injectionxScaleLabel As New JSONItem
		  
		  injectionxTicks.value("type") = "time"
		  
		  injectionxMonth.Value("second") =  "DD MMM YYYY"
		  injectionxDisplayFormats.Value("unit") = "second"
		  injectionxDisplayFormats.Value("displayFormats") = injectionxMonth
		  
		  injectionxTicks.Value("time") = injectionxDisplayFormats
		  
		  injectionxTitle.Value("display") = True
		  injectionxTitle.Value("labelString") =  "Date"
		  injectionxTitle.Value("fontSize") = 20
		  injectionxTicks.Value("scaleLabel") = injectionxTitle
		  injectionxTicks.value("distribution") = "linear"
		  injectionxAxes.add injectionxTicks
		  injectionScales.value("xAxes") = injectionxAxes
		  
		  
		  options.value("scales") = injectionScales
		  'System.DebugLog(Options.ToString)
		  
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
