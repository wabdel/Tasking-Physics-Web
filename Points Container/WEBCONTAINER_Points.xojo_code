#tag WebContainerControl
Begin WebContainer WEBCONTAINER_Points
   Compatibility   =   ""
   ControlCount    =   0
   ControlID       =   ""
   Enabled         =   True
   Height          =   376
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
   Width           =   650
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
      Height          =   290
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
      Width           =   610
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
      Top             =   318
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
		Sub Opening()
		  Me.Style.BackgroundColor = Design_Palette.COLOR_Surface_Primary
		End Sub
	#tag EndEvent

	#tag Event
		Sub Shown()
		  Latest_UPDATE = App.last_database_update
		  REFRESH_Timer.RunMode = WebTimer.RunModes.Multiple
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Function GET_Random_Planner() As Integer
		  If App.last_database_update <> Latest_UPDATE Then
		    
		    Points_ListBox.ReloadData
		    Points_Avg_Label.Text = "Average points = " + Format( Points_Average, "0.0") + " +/- " + Format( Points_stdev, "0.0")
		    Latest_UPDATE = App.last_database_update
		    
		  End If
		  
		  
		  
		  Var sql As String = "SELECT physics_tasking.points.user_id As user_id, " _
		  + "physics_tasking.points.total As total_points " _
		  + "FROM physics_tasking.points " _
		  + "WHERE is_active = TRUE " _
		  + "ORDER BY total DESC;"
		  
		  Var rs As RowSet = Physics_Tasking.SELECT_Statement( sql)
		  
		  Select Case rs.RowCount
		  Case 0
		    
		    Return -1
		    
		  Case 1
		    
		    Return rs.Column("user_id").IntegerValue
		    
		  End Select
		  
		  
		  Var user_id() As Integer
		  Var total() As Double
		  Var prob() As Double
		  
		  While Not rs.AfterLastRow
		    
		    user_id.Add( rs.Column("user_id").IntegerValue)
		    total.add( rs.Column("total_points").DoubleValue)
		    
		    rs.MoveToNextRow
		    
		  Wend
		  
		  
		  
		  
		  
		  If Points_Stdev = 0 Then
		    
		    Var r As Integer = System.Random.InRange(0, user_id.LastIndex)
		    
		    Return user_id(r)
		    
		    
		  End
		  
		  Var normalization As Double = 0
		  
		  Var p11 As Double = Numerical_Recipies.Cummulative_Normal_Distribution(2.0)
		  Var p1 As Double = Numerical_Recipies.Cummulative_Normal_Distribution(1.0)
		  Var p2 As Double = Numerical_Recipies.Cummulative_Normal_Distribution(0)
		  Var p3 As Double = Numerical_Recipies.Cummulative_Normal_Distribution(-1.0)
		  Var p4 As Double = Numerical_Recipies.Cummulative_Normal_Distribution(-2.0)
		  
		  For i As Integer = 0 To user_id.LastIndex
		    
		    Var z As Double = (total(i) - Points_Average)/Points_Stdev
		    Var p As Double = 1 - Numerical_Recipies.Cummulative_Normal_Distribution(z)
		    normalization = normalization + p
		    
		    
		  Next
		  
		  Var cum_prob As Double = 0
		  
		  For i As Integer = 0 To user_id.LastIndex
		    
		    Var z As Double = (total(i) - Points_Average)/Points_Stdev
		    Var p As Double = Numerical_Recipies.Cummulative_Normal_Distribution(z)
		    
		    cum_prob = cum_prob + (1- p) / normalization 
		    prob.Add( cum_prob)
		    
		  Next
		  
		  
		  Var r As Double = System.Random.Number
		  
		  For i As Integer = 0 To user_id.LastIndex
		    
		    If r <= prob(i) Then Return user_id(i)
		    
		  Next i
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private Latest_Update As DateTime
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mPoints_Average As Double
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mPoints_Stdev As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		Planners() As Physics_Tasking.CLASS_User_Record
	#tag EndProperty

	#tag ComputedProperty, Flags = &h21
		#tag Getter
			Get
			  Var sql As String = "SELECT AVG(physics_tasking.points.total) As average " _
			  + "FROM physics_tasking.points " _
			  + "WHERE is_active = TRUE;"
			  
			  Var rs As RowSet = Physics_Tasking.SELECT_Statement(sql)
			  
			  mPoints_Average = rs.Column("average").DoubleValue
			  Return mPoints_Average
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mPoints_Average = value
			End Set
		#tag EndSetter
		Private Points_Average As Double
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h21
		#tag Getter
			Get
			  Var sql As String = "SELECT STDDEV_SAMP(physics_tasking.points.total) As standard_deviation " _
			  + "FROM physics_tasking.points " _
			  + "WHERE is_active = TRUE;"
			  
			  Var rs As RowSet = Physics_Tasking.SELECT_Statement(sql)
			  
			  mPoints_Stdev = rs.Column("standard_deviation").DoubleValue
			  
			  Return mPoints_Stdev
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mPoints_Stdev = value
			End Set
		#tag EndSetter
		Private Points_Stdev As Double
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		Random_Planner_ID As Integer
	#tag EndProperty


#tag EndWindowCode

#tag Events Points_ListBox
	#tag Event
		Sub Opening()
		  Me.HasHeader = True
		  Me.RowSelectionType = WebListBox.RowSelectionTypes.None
		  Me.DataSource = New PointsDataSource
		  Me.ReloadData
		  Points_Avg_Label.Text = "Average points = " + Format( Points_Average, "0.0") + " +/- " + Format( Points_stdev, "0.0")
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Points_Avg_Label
	#tag Event
		Sub Opening()
		  Me.Style.ForegroundColor = Design_Palette.COLOR_Note
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events REFRESH_Timer
	#tag Event
		Sub Run()
		  If App.last_database_update <> Latest_UPDATE Then
		    
		    Points_ListBox.DataSource = New PointsDataSource
		    Points_ListBox.ReloadData
		    Points_Avg_Label.Text = "Average points = " + Format( Points_Average, "0.0") + " +/- " + Format( Points_stdev, "0.0")
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
