#tag WebContainerControl
Begin WebContainer WEBCONTAINER_User_Statistics_Plans
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
   Begin WebListBox Site_ListBox
      ColumnCount     =   1
      ColumnWidths    =   ""
      ControlID       =   ""
      DefaultRowHeight=   49
      Enabled         =   True
      GridLineStyle   =   3
      HasBorder       =   True
      HasHeader       =   False
      HeaderHeight    =   0
      Height          =   560
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
      Width           =   400
      _mPanelIndex    =   -1
   End
   Begin WebListBox Plan_Type_ListBox
      ColumnCount     =   1
      ColumnWidths    =   ""
      ControlID       =   ""
      DefaultRowHeight=   49
      Enabled         =   True
      GridLineStyle   =   3
      HasBorder       =   True
      HasHeader       =   False
      HeaderHeight    =   0
      Height          =   560
      HighlightSortedColumn=   True
      Index           =   -2147483648
      Indicator       =   0
      InitialValue    =   ""
      LastAddedRowIndex=   0
      LastColumnIndex =   0
      LastRowIndex    =   0
      Left            =   419
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
      Width           =   400
      _mPanelIndex    =   -1
   End
   Begin WebListBox Patients_ListBox
      ColumnCount     =   1
      ColumnWidths    =   ""
      ControlID       =   ""
      DefaultRowHeight=   49
      Enabled         =   True
      GridLineStyle   =   3
      HasBorder       =   True
      HasHeader       =   False
      HeaderHeight    =   0
      Height          =   560
      HighlightSortedColumn=   True
      Index           =   -2147483648
      Indicator       =   0
      InitialValue    =   ""
      LastAddedRowIndex=   0
      LastColumnIndex =   0
      LastRowIndex    =   0
      Left            =   819
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
      TabIndex        =   2
      TabStop         =   True
      Tooltip         =   ""
      Top             =   20
      Visible         =   True
      Width           =   401
      _mPanelIndex    =   -1
   End
End
#tag EndWebContainerControl

#tag WindowCode
	#tag Method, Flags = &h21
		Private Sub POPULATE_Patient_ListBox(plan_type_id as integer)
		  
		  Patients_ListBox.RemoveAllRows
		  
		  Var sql As String = "SELECT physics_tasking.patients.patient_id, physics_tasking.patients.mrn, " _
		  + "physics_tasking.plans.assignment_date, " _
		  + "CASE " _
		  + "WHEN datediff(due_date, assignment_date) <= 0 THEN " _
		  + "weight * 2 " _
		  + "WHEN datediff(due_date, assignment_date) <= 1 THEN " _ 
		  + "weight * 1.5 " _
		  + "WHEN datediff(due_date, assignment_date) <= 2 THEN " _
		  + "weight * 1.25 " _
		  + "ELSE " _
		  + "weight " _
		  + "END " _
		  + "AS sum " _ 
		  + "FROM physics_tasking.plans " _
		  + "INNER JOIN physics_tasking.plan_types USING(plan_type_id) " _
		  + "INNER JOIN physics_tasking.patients USING(patient_id) " _
		  + "WHERE user_id = " + Session.Logged_in_User.id.ToString + " " _
		  + "AND plan_type_id = " + plan_type_id.ToString + " " _
		  + "ORDER BY physics_tasking.plans.assignment_date DESC;"
		  
		  Var rs As RowSet = Physics_Tasking.SELECT_Statement( sql)
		  
		  While Not rs.AfterLastRow
		    
		    Patients_ListBox.AddRow()
		    Patients_ListBox.RowTagAt( Patients_ListBox.LastAddedRowIndex) = rs.Column("patient_id").IntegerValue
		    Patients_ListBox.CellTextAt( Patients_ListBox.LastAddedRowIndex, 0) = rs.Column("mrn").StringValue
		    
		    Patients_ListBox.CellTextAt( Patients_ListBox.LastAddedRowIndex, 1)  = _
		    rs.Column("assignment_date").DateTimeValue.ToString(Locale.Current, _
		    DateTime.FormatStyles.Full, DateTime.FormatStyles.None)
		    
		    Patients_ListBox.CellTextAt( Patients_ListBox.LastAddedRowIndex, 2)  = Format( rs.Column("sum").DoubleValue, "0.0")
		    
		    
		    rs.MoveToNextRow
		  Wend
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub POPULATE_Plan_Type_ListBox(site_id as Integer)
		  Plan_Type_ListBox.RemoveAllRows
		  Var sql As String = "SELECT physics_tasking.plan_types.plan_type_id, physics_tasking.plan_types.name, COUNT(*), " _
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
		  + "AND site_id = " + site_id.ToString + " " _
		  + "GROUP BY plan_type_id " _
		  + "ORDER BY name; "
		  
		  Var rs As RowSet = Physics_Tasking.SELECT_Statement( sql)
		  
		  While Not rs.AfterLastRow
		    
		    Plan_Type_ListBox.AddRow()
		    Plan_Type_ListBox.RowTagAt( Plan_Type_ListBox.LastAddedRowIndex) = rs.Column("plan_type_id").IntegerValue
		    Plan_Type_ListBox.CellTextAt( Plan_Type_ListBox.LastAddedRowIndex, 0) = rs.Column("name").StringValue.Trim 
		    
		    Plan_Type_ListBox.CellTextAt( Plan_Type_ListBox.LastAddedRowIndex, 1)  = rs.Column("COUNT(*)").IntegerValue.ToString
		    Plan_Type_ListBox.CellTagAt( Plan_Type_ListBox.LastAddedRowIndex, 1)  = rs.Column("COUNT(*)").IntegerValue
		    
		    Plan_Type_ListBox.CellTextAt( Plan_Type_ListBox.LastAddedRowIndex, 2)  = Format( rs.Column("sum").DoubleValue, "0.0")
		    Plan_Type_ListBox.CellTagAt( Plan_Type_ListBox.LastAddedRowIndex, 2)  = rs.Column("sum").DoubleValue
		    
		    rs.MoveToNextRow
		    
		  Wend
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub POPULATE_Site_ListBox()
		  Site_ListBox.RemoveAllRows
		  
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
		  
		  Var rs As RowSet = Physics_Tasking.SELECT_Statement( sql)
		  
		  While Not rs.AfterLastRow
		    
		    Site_ListBox.AddRow()
		    Site_ListBox.RowTagAt( Site_ListBox.LastAddedRowIndex) = rs.Column("site_id").IntegerValue
		    
		    If rs.Column("is_uppercase").BooleanValue Then
		      
		      Site_ListBox.CellTextAt( Site_ListBox.LastAddedRowIndex, 0) = rs.Column("name").StringValue.Trim.Uppercase
		      
		    Else
		      
		      Site_ListBox.CellTextAt( Site_ListBox.LastAddedRowIndex, 0) = rs.Column("name").StringValue.Trim.Titlecase
		      
		    End If
		    
		    Site_ListBox.CellTextAt( Site_ListBox.LastAddedRowIndex, 1)= rs.Column("COUNT(*)").IntegerValue.ToString
		    
		    Site_ListBox.CellTextAt( Site_ListBox.LastAddedRowIndex, 2) = Format( rs.Column("sum").DoubleValue, "0.0")
		    
		    rs.MoveToNextRow
		    
		  Wend
		  
		  
		  
		End Sub
	#tag EndMethod


#tag EndWindowCode

#tag Events Site_ListBox
	#tag Event
		Sub SelectionChanged(rows() As Integer)
		  Plan_Type_ListBox.Enabled = True
		  Patients_ListBox.RemoveAllRows
		  POPULATE_Plan_Type_ListBox( Me.RowTagAt( Me.SelectedRowIndex))
		End Sub
	#tag EndEvent
	#tag Event
		Sub Opening()
		  Me.ColumnCount =3
		  Me.HasHeader = True
		  Me.HeaderAt(0) = "Site"
		  Me.HeaderAt(1) = "Count"
		  Me.HeaderAt(2) = "Points"
		  POPULATE_Site_ListBox
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Plan_Type_ListBox
	#tag Event
		Sub Opening()
		  Me.ColumnCount =3
		  Me.HasHeader = True
		  Me.HeaderAt(0) = "Plan Type"
		  Me.HeaderAt(1) = "Count"
		  Me.HeaderAt(2) = "Points"
		  Me.Enabled = False
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub Pressed(row As Integer, column As Integer)
		  Patients_ListBox.Enabled = True
		  POPULATE_Patient_ListBox( Me.RowTagAt( Me.SelectedRowIndex))
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Patients_ListBox
	#tag Event
		Sub Opening()
		  Me.ColumnCount =3
		  Me.HasHeader = True
		  Me.HeaderAt(0) = "MRN"
		  Me.HeaderAt(1) = "Date"
		  Me.HeaderAt(2) = "Points"
		  Me.Enabled = False
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
