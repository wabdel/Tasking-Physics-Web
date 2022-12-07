#tag WebContainerControl
Begin WebContainer WEBCONTAINER_Statistics_Physicians
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
   _mName          =   ""
   _mPanelIndex    =   -1
   Begin WebDatePicker Month_DatePicker
      AllowKeyboardEntry=   True
      ControlID       =   ""
      EarliestDate    =   ""
      Enabled         =   True
      Height          =   38
      Index           =   -2147483648
      Indicator       =   ""
      InitialValue    =   ""
      LatestDate      =   ""
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      Scope           =   2
      TabIndex        =   0
      Tooltip         =   ""
      Top             =   20
      Visible         =   True
      Width           =   150
      _mPanelIndex    =   -1
   End
   Begin WebRadioGroup Data_RadioGroup
      ControlID       =   ""
      Enabled         =   True
      Height          =   60
      Horizontal      =   False
      Index           =   -2147483648
      Indicator       =   ""
      InitialValue    =   "Patients\nPlans"
      Left            =   1052
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      Scope           =   2
      SelectedIndex   =   0
      TabIndex        =   1
      Tooltip         =   ""
      Top             =   20
      Visible         =   True
      Width           =   168
      _mInitialValue  =   "Option 1\rOption 2"
      _mPanelIndex    =   -1
   End
   Begin WebChart Physician_Statistics_WebChart
      ControlID       =   ""
      DatasetCount    =   0
      Enabled         =   True
      HasAnimation    =   False
      HasLegend       =   False
      Height          =   492
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
      TabIndex        =   2
      Title           =   ""
      Tooltip         =   ""
      Top             =   88
      Visible         =   True
      Width           =   1200
      _mMode          =   0
      _mPanelIndex    =   -1
   End
   Begin WebLabel Total_Label
      Bold            =   False
      ControlID       =   ""
      Enabled         =   True
      FontName        =   ""
      FontSize        =   0.0
      Height          =   38
      Index           =   -2147483648
      Indicator       =   0
      Italic          =   False
      Left            =   506
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      Multiline       =   False
      Scope           =   2
      TabIndex        =   3
      Text            =   "Patients = "
      TextAlignment   =   2
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   42
      Underline       =   False
      Visible         =   True
      Width           =   227
      _mPanelIndex    =   -1
   End
End
#tag EndWebContainerControl

#tag WindowCode
	#tag Event
		Sub Opening()
		  Me.Style.BackgroundColor = Session.COLOR_Central_Background2
		  
		  Data_RadioGroup.SelectedIndex = 0
		  Month_DatePicker.SelectedDate = DateTime.Now
		  
		  POPULATE_Chart
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Sub POPULATE_Chart()
		  Var sql As String = "SELECT physician_id, initials, COUNT(DISTINCT(patient_id)) as count_patients, " _
		  + "SUM(physics_tasking.plan_types.no_of_plans) AS count_plans " _
		  + "FROM physics_tasking.plans " _
		  + "INNER JOIN physics_tasking.plan_types USING(plan_type_id) " _
		  + "INNER JOIN physics_tasking.users ON plans.physician_id = users.user_id " _
		  + "INNER JOIN physics_tasking.sites USING(site_id) " _
		  + "WHERE physician_id IS NOT NULL " _
		  + "AND is_completed = TRUE " _
		  + "AND is_retired = FALSE " _
		  + "AND MONTH(due_date) = " + Month_DatePicker.SelectedDate.Month.ToString + " " _
		  + "AND YEAR(due_date) = " + Month_DatePicker.SelectedDate.Year.ToString + " " _
		  + "GROUP BY physician_id " _
		  + "ORDER BY initials;"
		  
		  Var rs As RowSet = Physics_Tasking.DB_SELECT_Statement( sql)
		  
		  Var data() As Double
		  Var labels() As String
		  Physician_Statistics_WebChart.RemoveAllDatasets
		  Physician_Statistics_WebChart.RemoveAllLabels
		  
		  Select Case Data_RadioGroup.SelectedIndex
		  Case 0
		    
		    Total_Label.Visible = True
		    Var c As Integer = 0
		    
		    While Not rs.AfterLastRow
		      
		      data.Add( rs.Column("count_patients").DoubleValue)
		      
		      c = c + rs.Column("count_patients").DoubleValue
		      
		      
		      
		      labels.Add( rs.Column("initials").StringValue.Trim.Uppercase)
		      
		      rs.MoveToNextRow
		      
		    Wend
		    
		    Total_Label.Text = "Total patients = " + c.ToString
		    
		  Case 1
		    
		    Total_Label.Visible = True
		    Var c As Integer = 0
		    
		    While Not rs.AfterLastRow
		      
		      data.Add( rs.Column("count_plans").DoubleValue)
		      
		      c = c + rs.Column("count_plans").DoubleValue
		      
		      labels.Add( rs.Column("initials").StringValue.Trim.Uppercase)
		      
		      rs.MoveToNextRow
		      
		    Wend
		    
		    Total_Label.Text = "Total plans = " + c.ToString
		    
		    
		  End Select
		  
		  
		  
		  Var mySet As New WebChartLinearDataset("Bar Data", &cFF0000, True, data)
		  mySet.ChartType = WebChartLinearDataset.ChartTypes.Bar
		  Physician_Statistics_WebChart.AddDataset(mySet)
		  Physician_Statistics_WebChart.AddLabels(labels)
		  
		End Sub
	#tag EndMethod


#tag EndWindowCode

#tag Events Month_DatePicker
	#tag Event
		Sub DateChanged()
		  POPULATE_Chart
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Data_RadioGroup
	#tag Event
		Sub SelectionChanged(button as WebRadioButton)
		  POPULATE_Chart
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Physician_Statistics_WebChart
	#tag Event
		Sub Opening()
		  ME.Style.BackgroundColor = Color.White
		End Sub
	#tag EndEvent
	#tag Event
		Sub OverrideOptions(Options as JSONItem)
		  '//Format Title
		  Var title As New JSONItem
		  title.Value("display") = True
		  Select Case Data_RadioGroup.SelectedIndex
		  Case 0
		    title.Value("text") = "Patients per physician"
		  Case 1
		    
		    title.Value("text") = "Plans per physician"
		    
		    
		    
		  End Select
		  
		  title.Value("fontSize") = 24
		  Options.Value("title") = title
		  
		  Var injectionScales As New JSONItem
		  
		  '//Format yAxis
		  Var injectionyValue As New JSONItem
		  Var injectionyTicks As New JSONItem
		  Var injectionyTitle As New JSONItem
		  Var injectionyScaleLabel As New JSONItem
		  Var injectionyAxes As New JSONItem
		  
		  
		  injectionyValue.value("min") = 0
		  injectionyTicks.value("ticks") = injectionyValue
		  
		  
		  injectionyTitle.Value("display") = True
		  
		  Select Case Data_RadioGroup.SelectedIndex
		  Case 0
		    
		    injectionyTitle.Value("labelString") =  "No. of patients"
		    
		  Case 1
		    
		    injectionyTitle.Value("labelString") =  "No. of plans"
		    
		    
		  End Select
		  
		  injectionyTitle.Value("fontSize") = 20
		  injectionyTicks.Value("scaleLabel") = injectionyTitle
		  injectionyAxes.add( injectionyTicks)
		  injectionScales.value("yAxes") = injectionyAxes
		  
		  
		  '//Format xAxis
		  Var injectionxValue As New JSONItem
		  Var injectionxTicks As New JSONItem
		  Var injectionxTitle As New JSONItem
		  Var injectionxScaleLabel As New JSONItem
		  Var injectionxAxes As New JSONItem
		  
		  
		  injectionxValue.Value("autoSkip") = False
		  injectionxTicks.value("ticks") = injectionxValue 
		  injectionxAxes.add( injectionxTicks)
		  injectionScales.value("xAxes") = injectionxAxes
		  
		  options.value("scales") = injectionScales
		  options.value("scaleShowValues") = True
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
