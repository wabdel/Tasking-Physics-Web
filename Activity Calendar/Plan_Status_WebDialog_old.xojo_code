#tag WebPage
Begin WebDialog Plan_Status_WebDialog_old
   Compatibility   =   ""
   ControlCount    =   0
   ControlID       =   ""
   Enabled         =   True
   Height          =   392
   Index           =   -2147483648
   Indicator       =   0
   LayoutDirection =   0
   LayoutType      =   0
   Left            =   0
   LockBottom      =   False
   LockHorizontal  =   False
   LockLeft        =   False
   LockRight       =   False
   LockTop         =   False
   LockVertical    =   False
   PanelIndex      =   0
   Position        =   0
   TabIndex        =   0
   Top             =   0
   Visible         =   True
   Width           =   1117
   _mDesignHeight  =   0
   _mDesignWidth   =   0
   _mPanelIndex    =   -1
   Begin WebButton Close_Button
      AllowAutoDisable=   False
      Cancel          =   False
      Caption         =   "Close"
      ControlID       =   ""
      Default         =   True
      Enabled         =   True
      Height          =   38
      Index           =   -2147483648
      Indicator       =   1
      Left            =   503
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      Outlined        =   False
      PanelIndex      =   0
      Scope           =   2
      TabIndex        =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   334
      Visible         =   True
      Width           =   100
      _mPanelIndex    =   -1
   End
   Begin WebListBox Plans_ListBox
      ColumnCount     =   1
      ColumnWidths    =   ""
      ControlID       =   ""
      DefaultRowHeight=   49
      Enabled         =   True
      GridLineStyle   =   3
      HasBorder       =   True
      HasHeader       =   True
      HeaderHeight    =   0
      Height          =   306
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
      TabIndex        =   1
      TabStop         =   True
      Tooltip         =   ""
      Top             =   20
      Visible         =   True
      Width           =   1077
      _mPanelIndex    =   -1
   End
   Begin WebLabel Label1
      Bold            =   False
      ControlID       =   ""
      Enabled         =   True
      FontName        =   ""
      FontSize        =   0.0
      Height          =   38
      Index           =   -2147483648
      Indicator       =   0
      Italic          =   False
      Left            =   997
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      Multiline       =   False
      PanelIndex      =   0
      Scope           =   0
      TabIndex        =   2
      TabStop         =   True
      Text            =   "Untitled"
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   324
      Underline       =   False
      Visible         =   True
      Width           =   100
      _mPanelIndex    =   -1
   End
End
#tag EndWebPage

#tag WindowCode
	#tag Method, Flags = &h0
		Sub POPULATE()
		  Var sql As String = "SELECT physics_tasking.plans.plan_id As plan_id, " _
		  + "physics_tasking.patients.mrn As mrn, " _
		  + "physics_tasking.patients.first_name As first_name, " _
		  + "physics_tasking.patients.family_name As family_name, " _
		  + "physics_tasking.plan_types.name As plan_type_name, " _
		  + "physics_tasking.sites.name As site, " _
		  + "physics_tasking.sites.is_uppercase As is_uppercase, " _
		  + "physics_tasking.plans.assignment_date as assignment_date, " _
		  + "physics_tasking.plans.is_replan as is_replan, " _
		  + "physics_tasking.plans.is_completed as is_completed, " _
		  + "(" _
		  + "SELECT physics_tasking.users.initials " _
		  + "FROM physics_tasking.users " _
		  + "WHERE physics_tasking.plans.physician_id = physics_tasking.users.user_id" _
		  +") As physician_initials " _
		  + "FROM physics_tasking.plans " _
		  + "INNER JOIN physics_tasking.patients USING (patient_id) " _
		  + "INNER JOIN physics_tasking.plan_types USING (plan_type_id) " _
		  + "INNER JOIN physics_tasking.sites USING (site_id) " _
		  + "WHERE DATE(physics_tasking.plans.due_date) = '" + date.SQLDate + "' " _
		  + "AND user_id = " + user_id.ToString + " " _
		  + "ORDER BY physics_tasking.plans.is_completed;"
		  
		  Label1.Text = Self.RowCount.ToString
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function RowCount() As Integer
		  // Part of the WebDataSource interface.
		  
		  Var sql As String = "SELECT COUNT(*) as c FROM physics_tasking.plans " _
		  + "WHERE DATE(physics_tasking.plans.due_date) = '" + date.SQLDate + "' " _
		  + "AND user_id = " + user_id.ToString + " " _
		  + "ORDER BY physics_tasking.plans.is_completed;"
		  
		  Var rs As RowSet = Physics_Tasking.DB_SELECT_Statement( sql)
		  
		  
		  Return  rs.Column("c").IntegerValue
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function RowData(RowCount as Integer, RowOffset as Integer, SortColumns as String) As WebListboxRowData()
		  // Part of the WebDataSource interface.
		  
		  
		  Var rows() As WebListboxRowData
		  Var sql As String = "SELECT physics_tasking.plans.plan_id As plan_id, " _
		  + "physics_tasking.patients.mrn As mrn, " _
		  + "physics_tasking.patients.first_name As first_name, " _
		  + "physics_tasking.patients.family_name As family_name, " _
		  + "physics_tasking.plan_types.name As plan_type_name, " _
		  + "physics_tasking.sites.name As site, " _
		  + "physics_tasking.sites.is_uppercase As is_uppercase, " _
		  + "physics_tasking.plans.assignment_date as assignment_date, " _
		  + "physics_tasking.plans.is_replan as is_replan, " _
		  + "physics_tasking.plans.is_completed as is_completed, " _
		  + "(" _
		  + "SELECT physics_tasking.users.initials " _
		  + "FROM physics_tasking.users " _
		  + "WHERE physics_tasking.plans.physician_id = physics_tasking.users.user_id" _
		  +") As physician_initials " _
		  + "FROM physics_tasking.plans " _
		  + "INNER JOIN physics_tasking.patients USING (patient_id) " _
		  + "INNER JOIN physics_tasking.plan_types USING (plan_type_id) " _
		  + "INNER JOIN physics_tasking.sites USING (site_id) " _
		  + "WHERE DATE(physics_tasking.plans.due_date) = '" + date.SQLDate + "' " _
		  + "AND user_id = " + user_id.ToString + " " _
		  + "ORDER BY physics_tasking.plans.is_completed;"
		  
		  
		  Var rs As RowSet = Physics_Tasking.DB_SELECT_Statement( sql)
		  
		  While Not rs.AfterLastRow
		    
		    Var s As New WebStyle
		    
		    Select Case rs.Column("is_completed").BooleanValue
		    Case False
		      
		      s.BackgroundColor = Theme_Colors.Color_Palette.Fail //Color.Red
		      s.Bold = True
		      
		    Case True
		      
		      s.BackgroundColor = Theme_Colors.Color_Palette.Caution //Color.Orange
		      s.Bold = True
		      
		    End Select
		    
		    
		    Var row As New WebListBoxRowData
		    row.PrimaryKey = rs.Column("plan_id").IntegerValue
		    row.tag = rs.Column("plan_id").IntegerValue
		    
		    Var cellRenderer As New WebListBoxStyleRenderer(s, rs.Column("mrn").StringValue.Trim)
		    row.Value("mrn") = cellRenderer
		    
		    'cellRenderer = New WebListBoxStyleRenderer(s, _
		    'rs.Column("first_name").StringValue.Trim.Titlecase + " " _
		    '+ rs.Column("family_name").StringValue.Trim.Uppercase)
		    'row.Value("full_name") = cellRenderer
		    '
		    'If rs.Column("is_uppercase").BooleanValue Then
		    '
		    'cellRenderer = New WebListBoxStyleRenderer(s, rs.Column("site").StringValue.Trim.Uppercase)
		    '
		    'Else
		    '
		    'cellRenderer = New WebListBoxStyleRenderer(s, rs.Column("site").StringValue.Trim.Titlecase)
		    '
		    'End If
		    '
		    'row.Value("site") = cellRenderer
		    '
		    'If rs.Column("is_replan").BooleanValue Then
		    '
		    'cellRenderer = New WebListBoxStyleRenderer(s, rs.Column("plan_type_name").StringValue.Trim + " (R)") 
		    '
		    'Else
		    '
		    'cellRenderer = New WebListBoxStyleRenderer(s, rs.Column("plan_type_name").StringValue.Trim) 
		    '
		    'End If
		    '
		    'row.Value("plan_type") = cellRenderer
		    '
		    'Var d As DateTime = rs.Column("assignment_date").DateValue
		    'cellRenderer = New WebListBoxStyleRenderer(s, _
		    'd.ToString(Locale.Current, DateTime.FormatStyles.Full, DateTime.FormatStyles.None))
		    'row.Value("assignment_date") = cellRenderer
		    '
		    'cellRenderer = New WebListBoxStyleRenderer(s, rs.Column("physician_initials").StringValue.Trim.Uppercase)
		    'row.Value("physician_initials") = cellRenderer
		    
		    rs.MoveToNextRow
		  Wend
		  rs.Close
		  
		  Return rows
		  
		  
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function SortedPrimaryKeys(sortColumns as String) As Integer()
		  // Part of the WebDataSource interface.
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function UnsortedPrimaryKeys() As Integer()
		  // Part of the WebDataSource interface.
		  
		  Var keys() As Integer 
		  
		  Var sql As String = "SELECT physics_tasking.plans.plan_id As plan_id " _
		  + "FROM physics_tasking.plans " _
		  + "WHERE DATE(physics_tasking.plans.due_date) = '" + date.SQLDate + "' " _
		  + "AND user_id = " + user_id.ToString + " " _
		  + "ORDER BY physics_tasking.plans.is_completed;"
		  
		  
		  Var rs As RowSet = Physics_Tasking.DB_SELECT_Statement( sql)
		  
		  While Not rs.AfterLastRow
		    keys.Append( rs.Column("plan_id").IntegerValue)
		    
		    rs.MoveToNextRow
		  Wend
		  Return keys
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		date As DateTime
	#tag EndProperty

	#tag Property, Flags = &h0
		User_Id As Integer
	#tag EndProperty


#tag EndWindowCode

#tag Events Close_Button
	#tag Event
		Sub Pressed()
		  Self.Close
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Plans_ListBox
	#tag Event
		Sub Opening()
		  Me.HasHeader = True
		  Me.RowSelectionType = WebListBox.RowSelectionTypes.None
		  Me.ColumnCount = 6
		  Me.HeaderAt(0) = "MRN"
		  Me.HeaderAt(1) = "Name"
		  Me.HeaderAt(2) = "Site"
		  Me.HeaderAt(3) = "Plan type"
		  Me.HeaderAt(4) = "Assigned on"
		  Me.HeaderAt(5) = "Physician"
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
		Name="Position"
		Visible=true
		Group="Position"
		InitialValue="0"
		Type="WebDialog.Positions"
		EditorType="Enum"
		#tag EnumValues
			"0 - Top"
			"1 - Center"
		#tag EndEnumValues
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
		Name="Index"
		Visible=false
		Group="ID"
		InitialValue="-2147483648"
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
		Name="Height"
		Visible=true
		Group="Behavior"
		InitialValue="400"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LayoutType"
		Visible=true
		Group="Behavior"
		InitialValue="LayoutTypes.Fixed"
		Type="LayoutTypes"
		EditorType="Enum"
		#tag EnumValues
			"0 - Fixed"
			"1 - Flex"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockBottom"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockHorizontal"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockLeft"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockRight"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockTop"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockVertical"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Width"
		Visible=true
		Group="Behavior"
		InitialValue="600"
		Type="Integer"
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
		Name="LayoutDirection"
		Visible=true
		Group="WebView"
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
		Name="User_Id"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
