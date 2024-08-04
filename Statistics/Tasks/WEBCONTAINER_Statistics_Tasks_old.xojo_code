#tag WebContainerControl
Begin WebContainer WEBCONTAINER_Statistics_Tasks_old
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
   Begin WebListBox Task_Groups_ListBox
      ColumnCount     =   1
      ColumnWidths    =   ""
      ControlID       =   ""
      DefaultRowHeight=   49
      Enabled         =   True
      GridLineStyle   =   3
      HasBorder       =   True
      HasHeader       =   False
      HeaderHeight    =   0
      Height          =   513
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
      Top             =   20
      Visible         =   True
      Width           =   400
      _mPanelIndex    =   -1
   End
   Begin WebLabel Task_Groups_Label
      Bold            =   False
      ControlID       =   ""
      Enabled         =   True
      FontName        =   ""
      FontSize        =   0.0
      Height          =   38
      Index           =   -2147483648
      Indicator       =   ""
      Italic          =   False
      Left            =   253
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
      Text            =   "Task groups = 0"
      TextAlignment   =   3
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   541
      Underline       =   False
      Visible         =   True
      Width           =   167
      _mPanelIndex    =   -1
   End
   Begin WebChart PiChart
      AllowPopover    =   True
      AutoCalculateYAxis=   False
      ControlID       =   ""
      DatasetCount    =   0
      DatasetLastIndex=   0
      Enabled         =   True
      GridColor       =   &c000000AA
      HasAnimation    =   False
      HasLegend       =   True
      Height          =   500
      Index           =   -2147483648
      Indicator       =   ""
      IsGridVisible   =   False
      IsXAxisVisible  =   False
      IsYAxisVisible  =   False
      LabelCount      =   0
      LabelLastIndex  =   0
      Left            =   571
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
      Mode            =   3
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
      Top             =   33
      Visible         =   True
      Width           =   574
      _mMode          =   ""
      _mPanelIndex    =   -1
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
		Private Sub Plot_PIChart(task_group_id as Integer)
		  
		  Var sql As String
		  
		  Select Case task_group_id
		  Case -1
		    
		    Return
		    
		  Case 0
		    
		    sql = "SELECT task_group_id, task_groups.name AS name, SUM( " _
		    + "weight * multiplier) AS points " _
		    + "FROM tasks INNER JOIN task_types Using(task_type_id) " _
		    + "INNER JOIN task_groups Using(task_group_id) " _
		    + "GROUP BY task_group_id"
		    
		    
		    
		    
		  Else
		    
		    sql = "SELECT task_type_id, task_types.name AS name, SUM( " _
		    + "weight * multiplier) AS points " _
		    + "FROM tasks INNER JOIN task_types Using(task_type_id) " _
		    + "INNER JOIN task_groups Using(task_group_id) " _
		    + "WHERE task_group_id = " + task_group_id.ToString + " " _
		    + "GROUP BY task_type_id "
		    
		  End Select
		  
		  Var rs As RowSet = Physics_Tasking.SELECT_Statement(sql)
		  
		  
		  Var data() As Double
		  Var colors() As Color
		  Var labels() As String
		  PiChart.RemoveAllDatasets
		  PiChart.RemoveAllLabels
		  
		  While Not rs.AfterLastRow
		    data.Add( rs.Column("points").DoubleValue)
		    
		    Var red As Integer = System.Random.InRange(0, 255)
		    Var green As Integer = System.Random.InRange(0, 255)
		    Var blue As Integer = System.Random.InRange(0, 255)
		    
		    Var mix As Color = &cffffff
		    
		    Var c As Color = Color.RGB( (red + mix.Red) /2, (green + mix.Green) /2, (blue + mix.Blue) /2)
		    Colors.Add( c )
		    labels.Add(  rs.Column("name").StringValue.Trim.Left(3))
		    
		    rs.MoveToNextRow
		  Wend
		  
		  Var mySet As New WebChartCircularDataset("Replans", data, colors)
		  PiChart.AddDataset(mySet)
		  PiChart.AddLabels(labels)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Plot_PIChart112213(task_group_id as Integer)
		  
		  Var sql As String
		  
		  Select Case task_group_id
		  Case -1
		    
		    Return
		    
		  Case 0
		    
		    sql = "SELECT task_group_id, task_groups.name AS name, SUM( " _
		    + "weight * multiplier) AS points " _
		    + "FROM tasks INNER JOIN task_types Using(task_type_id) " _
		    + "INNER JOIN task_groups Using(task_group_id) " _
		    + "GROUP BY task_group_id"
		    
		    
		    
		    
		  Else
		    
		    sql = "SELECT task_type_id, task_types.name AS name, SUM( " _
		    + "weight * multiplier) AS points " _
		    + "FROM tasks INNER JOIN task_types Using(task_type_id) " _
		    + "INNER JOIN task_groups Using(task_group_id) " _
		    + "WHERE task_group_id = " + task_group_id.ToString + " " _
		    + "GROUP BY task_type_id "
		    
		  End Select
		  
		  Var rs As RowSet = Physics_Tasking.SELECT_Statement(sql)
		  
		  
		  Var data() As Double
		  Var colors() As Color
		  Var labels() As String
		  PiChart.RemoveAllDatasets
		  PiChart.RemoveAllLabels
		  
		  data.Add( 7)
		  Colors.Add( Color.Red)
		  labels.Add( "regular")
		  data.Add( 3)
		  labels.Add( "replan")
		  Colors.Add( Color.Blue)
		  data.Add( 5)
		  labels.Add( "replan")
		  Colors.Add( Color.Green)
		  
		  'Var mySet As New WebChartCircularDataset("Replans", data, colors)
		  'Replan_WebChart.AddDataset(mySet)
		  'Replan_WebChart.AddLabels(labels)
		  
		  Var mySet As New WebChartCircularDataset("Replans", data, colors)
		  PiChart.AddDataset(mySet)
		  PiChart.AddLabels(labels)
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private Latest_UPDATE As DateTime
	#tag EndProperty


#tag EndWindowCode

#tag Events Task_Groups_ListBox
	#tag Event
		Sub Opening()
		  Me.HasHeader = True
		  Me.RowSelectionType = WebListBox.RowSelectionTypes.Single
		  Me.DataSource = New TaskGroupsDataSource
		  Me.ReloadData
		  Task_Groups_Label.Text = "Task Groups = " + Me.DataSource.RowCount.ToString
		  Plot_PIChart( 0)
		  Latest_UPDATE = App.last_database_update
		End Sub
	#tag EndEvent
	#tag Event
		Sub SelectionChanged(rows() As Integer)
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub Pressed(row As Integer, column As Integer)
		  
		  Plot_PIChart( Me.RowTagAt( row))
		  
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Task_Groups_Label
	#tag Event
		Sub Opening()
		  Me.Style.ForegroundColor = App.Colour_Note
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PiChart
	#tag Event
		Sub Opening()
		  ME.Style.BackgroundColor = Color.White
		End Sub
	#tag EndEvent
	#tag Event
		Sub OverrideOptions(options As JSONItem)
		  Var legend As New JSONItem
		  legend.Value("display") = True
		  
		  
		  'title.Value("fontSize") = 24
		  Options.Value("legend") = legend
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
