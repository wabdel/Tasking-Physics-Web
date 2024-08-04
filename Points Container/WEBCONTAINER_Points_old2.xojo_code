#tag WebContainerControl
Begin WebContainer WEBCONTAINER_Points_old2
   Compatibility   =   ""
   ControlCount    =   0
   ControlID       =   ""
   Enabled         =   True
   Height          =   300
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
   Width           =   500
   _mDesignHeight  =   0
   _mDesignWidth   =   0
   _mPanelIndex    =   -1
   Begin WebListBox Points_ListBox
      ColumnCount     =   1
      ColumnWidths    =   ""
      ControlID       =   ""
      DefaultRowHeight=   49
      Enabled         =   True
      GridLineStyle   =   3
      HasBorder       =   True
      HasHeader       =   True
      HeaderHeight    =   0
      Height          =   214
      HighlightSortedColumn=   True
      Index           =   -2147483648
      Indicator       =   0
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
      Width           =   456
      _mPanelIndex    =   -1
   End
   Begin WebLabel Points_Avg_Label
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
      Text            =   "Average points = 0.0"
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   242
      Underline       =   False
      Visible         =   True
      Width           =   309
      _mPanelIndex    =   -1
   End
   Begin WebTimer REFRESH_Timer
      ControlID       =   ""
      Enabled         =   True
      Index           =   -2147483648
      Location        =   0
      LockedInPosition=   False
      PanelIndex      =   0
      Period          =   1000
      RunMode         =   2
      Scope           =   2
      _mPanelIndex    =   -1
   End
End
#tag EndWebContainerControl

#tag WindowCode
	#tag Event
		Sub Shown()
		  Latest_UPDATE = App.last_database_update
		  REFRESH_Timer.RunMode = WebTimer.RunModes.Multiple
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Function GET_Random_Planner() As Integer
		  If App.last_database_update <> Latest_UPDATE Then
		    
		    POPULATE_Points_listbox
		    Latest_UPDATE = App.last_database_update
		    
		  End If
		  
		  
		  Var r As Double = System.Random.Number
		  Var cumulative_probability As Double = 0
		  
		  For i As Integer = 0 To Points_ListBox.LastRowIndex
		    
		    cumulative_probability = cumulative_probability + Points_ListBox.CellTagAt(i,4)
		    
		    If r <= cumulative_probability Then Return Points_ListBox.RowTagAt(i) 
		    
		  Next i
		  
		  Var i As Integer = System.Random.InRange(0, Points_ListBox.LastRowIndex)
		  
		  Return Points_ListBox.RowTagAt(i) 
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub POPULATE_Points_listbox()
		  Points_ListBox.RemoveAllRows
		  
		  //----------------------
		  Var sql As String = "SELECT COUNT(user_id) as count, AVG(total) as average, STDDEV_SAMP(total) as std " _
		  + "FROM physics_tasking.points " _
		  + "WHERE is_active = TRUE;"
		  
		  Var rs As RowSet = Physics_Tasking.SELECT_Statement( sql)
		  
		  
		  
		  If rs = Nil Then 
		    
		    Points_Average = 0
		    Points_stdev = 0
		    
		  Else
		    
		    Points_Average = rs.Column("average").DoubleValue
		    Points_stdev = rs.Column("std").DoubleValue
		    
		  End If
		  
		  Points_Avg_Label.Text = "Average points = " + Format( Points_Average, "0.0") + " +/- " + Format( Points_stdev, "0.0")
		  
		  
		  
		  
		  //----------------------
		  
		  Var p11 As Double = Numerical_Recipies.Cummulative_Normal_Distribution(2.0)
		  Var p1 As Double = Numerical_Recipies.Cummulative_Normal_Distribution(1.0)
		  
		  Var p2 As Double = Numerical_Recipies.Cummulative_Normal_Distribution(0)
		  Var p3 As Double = Numerical_Recipies.Cummulative_Normal_Distribution(-1.0)
		  Var p4 As Double = Numerical_Recipies.Cummulative_Normal_Distribution(-2.0)
		  
		  sql = "SELECT user_id, total " _
		  + "FROM physics_tasking.points " _
		  + "WHERE is_active = TRUE;"
		  
		  rs = Physics_Tasking.SELECT_Statement( sql)
		  
		  Var normalization As Double = 0
		  
		  While Not rs.AfterLastRow
		    
		    Var z As Double = (rs.Column("total").DoubleValue - Points_Average) / Points_stdev
		    Var p As Double = 1 - Numerical_Recipies.Cummulative_Normal_Distribution(z)
		    normalization = normalization + p
		    
		    rs.MoveToNextRow
		    
		  Wend
		  
		  
		  //----------------------
		  
		  
		  sql = "SELECT physics_tasking.points.user_id As user_id, " _
		  + "physics_tasking.points.tasks_total As tasks_total, " _
		  + "physics_tasking.points.plans_total As plans_total, " _
		  + "physics_tasking.points.total As total, " _
		  + "physics_tasking.users.initials As initials, " _
		  + "physics_tasking.users.is_active As is_active " _
		  + "FROM physics_tasking.points " _
		  + "INNER JOIN physics_tasking.users USING (user_id) " _
		  + "ORDER BY total DESC"
		  
		  rs = Physics_Tasking.SELECT_Statement( sql)
		  
		  
		  While Not rs.AfterLastRow
		    
		    Var s As New WebStyle
		    
		    s.FontSize = 15
		    
		    Select Case rs.Column("is_active").BooleanValue
		    Case False
		      
		      s.BackgroundColor = Theme_Colors.Color_Palette.Caution  //App.Colour_Warn //Color.Red
		      
		      
		    Case False
		      
		      
		    End Select
		    
		    
		    
		    Points_ListBox.AddRow()
		    Points_ListBox.RowTagAt( Points_ListBox.LastAddedRowIndex) = rs.Column("user_id").IntegerValue
		    
		    Var cellRenderer As New WebListBoxStyleRenderer(s, rs.Column("initials").StringValue.Trim.Uppercase)
		    Points_ListBox.CellTextAt(Points_ListBox.LastAddedRowIndex, 0) = cellRenderer
		    Points_ListBox.CellTagAt(Points_ListBox.LastAddedRowIndex, 0) = rs.Column("initials").StringValue
		    
		    cellRenderer = New WebListBoxStyleRenderer(s, Format( rs.Column("plans_total").DoubleValue, "0.0"))
		    Points_ListBox.CellTextAt(Points_ListBox.LastAddedRowIndex, 1) = cellRenderer
		    Points_ListBox.CellTagAt(Points_ListBox.LastAddedRowIndex, 1) = rs.Column("plans_total").DoubleValue
		    
		    cellRenderer = New WebListBoxStyleRenderer(s, Format( rs.Column("tasks_total").DoubleValue, "0.0"))
		    Points_ListBox.CellTextAt(Points_ListBox.LastAddedRowIndex, 2) = cellRenderer
		    Points_ListBox.CellTagAt(Points_ListBox.LastAddedRowIndex, 2) = rs.Column("tasks_total").DoubleValue
		    
		    cellRenderer = New WebListBoxStyleRenderer(s, Format( rs.Column("total").DoubleValue, "0.0"))
		    Points_ListBox.CellTextAt(Points_ListBox.LastAddedRowIndex, 3) = cellRenderer
		    Points_ListBox.CellTagAt(Points_ListBox.LastAddedRowIndex, 3) = rs.Column("total").DoubleValue
		    
		    
		    If Not rs.Column("is_active").BooleanValue Or Points_stdev = 0 Then
		      
		      cellRenderer = New WebListBoxStyleRenderer(s, "---")
		      Points_ListBox.CellTextAt(Points_ListBox.LastAddedRowIndex, 4) = cellRenderer
		      Points_ListBox.CellTagAt(Points_ListBox.LastAddedRowIndex, 4) = 0
		      
		    Else
		      
		      Var z As Double = (rs.Column("total").DoubleValue - Points_Average) / Points_stdev
		      Var p As Double = 1 - Numerical_Recipies.Cummulative_Normal_Distribution(z)
		      
		      
		      p = p / normalization
		      
		      cellRenderer = New WebListBoxStyleRenderer(s, Format( p, "%0.0"))
		      Points_ListBox.CellTextAt(Points_ListBox.LastAddedRowIndex, 4) = cellRenderer
		      Points_ListBox.CellTagAt(Points_ListBox.LastAddedRowIndex, 4) = p
		      
		    End If
		    
		    
		    
		    rs.MoveToNextRow
		  Wend
		  
		  
		  
		  
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private Latest_Update As DateTime
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Points_Average As Double
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Points_stdev As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		Random_Planner_ID As Integer
	#tag EndProperty


#tag EndWindowCode

#tag Events Points_ListBox
	#tag Event
		Sub Opening()
		  Me.HasHeader = True
		  Me.RowSelectionType = WebListBox.RowSelectionTypes.None
		  Me.ColumnCount = 5
		  Me.HeaderAt(0) = "Initials"
		  Me.HeaderAt(1) = "Plans"
		  Me.HeaderAt(2) = "Tasks"
		  Me.HeaderAt(3) ="Total"
		  Me.HeaderAt(4) = "Prob."
		  
		  
		  POPULATE_Points_listbox
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Points_Avg_Label
	#tag Event
		Sub Opening()
		  Me.Style.ForegroundColor = Design_Palette.COLOR_Foreground
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events REFRESH_Timer
	#tag Event
		Sub Run()
		  If App.last_database_update <> Latest_UPDATE Then
		    
		    POPULATE_Points_listbox
		    Latest_UPDATE = App.last_database_update
		    
		  End If
		  
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
	#tag ViewProperty
		Name="Random_Planner_ID"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
