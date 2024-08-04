#tag WebContainerControl
Begin WebContainer WEBCONTAINER_User_Statistics_Sites
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
   Begin WebRadioGroup Plot_Options_RadioGroup
      ControlID       =   ""
      Enabled         =   True
      Height          =   60
      Horizontal      =   True
      Index           =   -2147483648
      Indicator       =   0
      InitialValue    =   "Counts\nTotal Points\nPoints / Plan"
      Left            =   402
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
      TabIndex        =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   20
      Visible         =   True
      Width           =   435
      _mInitialValue  =   "Option 1\rOption 2"
      _mPanelIndex    =   -1
   End
   Begin WebChart Site_Statistics_WebChart
      AllowPopover    =   True
      AutoCalculateYAxis=   False
      ControlID       =   ""
      DatasetCount    =   0
      DatasetLastIndex=   0
      Enabled         =   True
      GridColor       =   &c000000AA
      HasAnimation    =   False
      HasLegend       =   False
      Height          =   492
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
      Top             =   88
      Visible         =   True
      Width           =   1200
      _mMode          =   0
      _mPanelIndex    =   -1
   End
End
#tag EndWebContainerControl

#tag WindowCode
	#tag Event
		Sub Shown()
		  POPULATE_Chart
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Sub POPULATE_Chart()
		  Var sql As String = "SELECT site_id, physics_tasking.sites.name, physics_tasking.sites.is_uppercase, COUNT(*), " _
		  + "SUM( " _
		  + "CASE " _
		  + "WHEN datediff(due_date, assignment_date) <= 0 THEN " _
		  + "weight * 2 " _
		  + "WHEN datediff(due_date, assignment_date) <= 1 THEN " _ 
		  + "weight * 1.5 " _
		  + "WHEN datediff(due_date, assignment_date) <= 2 THEN " _
		  + "weight * 1.25 " _
		  + "ELSE " _
		  + "weight " _
		  + "END) " _
		  + "AS sum " _
		  + "FROM physics_tasking.plans " _
		  + "INNER JOIN physics_tasking.plan_types USING(plan_type_id) " _
		  + "INNER JOIN physics_tasking.sites USING(site_id) " _
		  + "WHERE user_id = " + Session.Logged_in_User.id.ToString + " " _
		  + "GROUP BY site_id " _
		  + "ORDER BY name; "
		  
		  Var rs As RowSet = Physics_Tasking.DB_SELECT_Statement( sql)
		  
		  Var data() As Double
		  Var labels() As String
		  
		  Site_Statistics_WebChart.RemoveAllDatasets
		  Site_Statistics_WebChart.RemoveAllLabels
		  
		  Select Case Plot_Options_RadioGroup.SelectedIndex
		  Case 0
		    
		    Site_Statistics_WebChart.Title = "Plans per site"
		    
		    While Not rs.AfterLastRow
		      
		      data.Add( rs.Column("COUNT(*)").DoubleValue)
		      
		      If rs.Column("is_uppercase").BooleanValue Then
		        
		        labels.Add( rs.Column("name").StringValue.Trim.Uppercase)
		        
		      Else
		        
		        labels.Add( rs.Column("name").StringValue.Trim.Titlecase)
		        
		      End If
		      
		      rs.MoveToNextRow
		      
		    Wend
		    
		    
		    
		  Case 1
		    
		    Site_Statistics_WebChart.Title = "Points per site"
		    
		    While Not rs.AfterLastRow
		      
		      data.Add( rs.Column("sum").DoubleValue)
		      If rs.Column("is_uppercase").BooleanValue Then
		        
		        labels.Add( rs.Column("name").StringValue.Trim.Uppercase)
		        
		      Else
		        
		        labels.Add( rs.Column("name").StringValue.Trim.Titlecase)
		        
		      End If
		      rs.MoveToNextRow
		      
		    Wend
		    
		  Case 2
		    
		    Site_Statistics_WebChart.Title = "Point / plan per site"
		    
		    While Not rs.AfterLastRow
		      
		      data.Add( rs.Column("sum").DoubleValue / rs.Column("COUNT(*)").DoubleValue)
		      If rs.Column("is_uppercase").BooleanValue Then
		        
		        labels.Add( rs.Column("name").StringValue.Trim.Uppercase)
		        
		      Else
		        
		        labels.Add( rs.Column("name").StringValue.Trim.Titlecase)
		        
		      End If
		      rs.MoveToNextRow
		      
		    Wend
		    
		    
		  End Select
		  
		  
		  
		  Var mySet As New WebChartLinearDataset("Bar Data", &cFF0000, True, data)
		  mySet.ChartType = WebChartLinearDataset.ChartTypes.Bar
		  
		  
		  Site_Statistics_WebChart.AddDataset(mySet)
		  Site_Statistics_WebChart.AddLabels(labels)
		  
		End Sub
	#tag EndMethod


#tag EndWindowCode

#tag Events Plot_Options_RadioGroup
	#tag Event
		Sub ValueChanged(button As WebRadioButton)
		  POPULATE_Chart
		End Sub
	#tag EndEvent
	#tag Event
		Sub Opening()
		  Me.Style.ForegroundColor = Design_Palette.COLOR_Foreground
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Site_Statistics_WebChart
	#tag Event
		Sub Opening()
		  ME.Style.BackgroundColor = Color.White
		End Sub
	#tag EndEvent
	#tag Event
		Sub OverrideOptions(options As JSONItem)
		  '//Format Title
		  Var title As New JSONItem
		  title.Value("display") = True
		  Select Case Plot_Options_RadioGroup.SelectedIndex
		  Case 0
		    title.Value("text") = "Plans per site"
		  Case 1
		    
		    title.Value("text") = "Points per site"
		    
		  Case 2
		    
		    title.Value("text") = "Points/plan per site"
		    
		  End Select
		  
		  title.Value("fontSize") = 24
		  Options.Value("title") = title
		  
		  
		  '//Format yAxis
		  Var injectionValue As New JSONItem
		  Var injectionTicks As New JSONItem
		  Var injectionTitle As New JSONItem
		  Var injectionScaleLabel As New JSONItem
		  Var injectionyAxes As New JSONItem
		  Var injectionScales As New JSONItem
		  
		  injectionValue.value("min") = 0
		  injectionTicks.value("ticks") = injectionValue
		  
		  
		  injectionTitle.Value("display") = True
		  
		  Select Case Plot_Options_RadioGroup.SelectedIndex
		  Case 0
		    
		    injectionTitle.Value("labelString") =  "No. of plans"
		    
		  Case 1
		    
		    injectionTitle.Value("labelString") =  "Points"
		    
		  Case 2
		    
		    injectionTitle.Value("labelString") =  "Points / plan"
		    
		  End Select
		  
		  injectionTitle.Value("fontSize") = 20
		  injectionTicks.Value("scaleLabel") = injectionTitle
		  injectionyAxes.add injectionTicks
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
		  
		  'System.DebugLog(Options.ToString)
		  
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
