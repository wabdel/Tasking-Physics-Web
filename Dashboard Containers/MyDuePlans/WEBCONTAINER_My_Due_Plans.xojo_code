#tag WebContainerControl
Begin WebContainer WEBCONTAINER_My_Due_Plans
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
   Begin WebLabel My_Plans_Label
      Bold            =   False
      ControlID       =   ""
      Enabled         =   True
      FontName        =   ""
      FontSize        =   0.0
      Height          =   38
      Index           =   -2147483648
      Indicator       =   0
      Italic          =   False
      Left            =   1120
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      Multiline       =   False
      Scope           =   2
      TabIndex        =   0
      Text            =   "Plans = 0"
      TextAlignment   =   3
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   542
      Underline       =   False
      Visible         =   True
      Width           =   100
      _mPanelIndex    =   -1
   End
   Begin WebListBox My_Due_Plans_ListBox
      ColumnCount     =   6
      ColumnWidths    =   ""
      ControlID       =   ""
      Enabled         =   True
      HasHeader       =   True
      Height          =   514
      HighlightSortedColumn=   True
      Index           =   -2147483648
      Indicator       =   0
      InitialValue    =   ""
      LastAddedRowIndex=   0
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
      ProcessingMessage=   ""
      RowCount        =   0
      RowSelectionType=   0
      Scope           =   2
      SearchCriteria  =   ""
      SelectedRowColor=   &c0272D300
      SelectedRowIndex=   0
      TabIndex        =   1
      Tooltip         =   ""
      Top             =   20
      Visible         =   True
      Width           =   1200
      _mPanelIndex    =   -1
   End
   Begin WebTimer Update_Timer
      ControlID       =   ""
      Enabled         =   True
      Index           =   -2147483648
      Location        =   0
      LockedInPosition=   False
      Period          =   1000
      RunMode         =   2
      Scope           =   2
      _mPanelIndex    =   -1
   End
   Begin WebLabel Note_Label
      Bold            =   False
      ControlID       =   ""
      Enabled         =   True
      FontName        =   ""
      FontSize        =   15.0
      Height          =   38
      Index           =   -2147483648
      Indicator       =   0
      Italic          =   True
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      Multiline       =   False
      Scope           =   2
      TabIndex        =   2
      Text            =   "Double click a row to modify."
      TextAlignment   =   1
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   542
      Underline       =   False
      Visible         =   True
      Width           =   650
      _mPanelIndex    =   -1
   End
End
#tag EndWebContainerControl

#tag WindowCode
	#tag Event
		Sub Opening()
		  Me.Style.BackgroundColor = Session.COLOR_Central_Background2
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h21
		Private Latest_Update As DateTime
	#tag EndProperty


#tag EndWindowCode

#tag Events My_Plans_Label
	#tag Event
		Sub Opening()
		  Me.Style = Session.WEBSTYLE_Label
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events My_Due_Plans_ListBox
	#tag Event
		Sub Opening()
		  Me.HasHeader = True
		  Me.RowSelectionType = WebListBox.RowSelectionTypes.None
		  Me.DataSource = New MyDuePlansDataSource
		  Me.ReloadData
		  My_Plans_Label.Text = "Plans = " + Me.DataSource.RowCount.ToString
		  Latest_Update = DateTime.Now
		End Sub
	#tag EndEvent
	#tag Event
		Sub CustomCellAction(row as Integer, column as Integer, identifier as string, value as variant)
		  If identifier = "GroupButtonPressed" Then
		    
		    Var db As New MySQLCommunityServer
		    
		    db.Host = Physics_Tasking.DB_Host
		    db.Port = Physics_Tasking.DB_Port
		    db.DatabaseName = Physics_Tasking.DB_DatabaseName
		    db.UserName = Physics_Tasking.DB_UserName
		    db.Password = Physics_Tasking.DB_Password
		    
		    Try
		      
		      If db.Connect Then
		        
		        Var sql As String = "UPDATE  physics_tasking.plans " _
		        + "SET is_completed = TRUE, " _
		        + "completion_Date = '" + DateTime.Now.SQLDate + "' " _
		        + "WHERE plan_id = " + Me.RowTagAt( row)
		        
		        db.ExecuteSQL(sql)
		        
		        App.last_database_update = DateTime.Now
		        Latest_Update = App.last_database_update
		        
		        My_Due_Plans_ListBox.ReloadData
		        My_Plans_Label.Text = "Plans = " + My_Due_Plans_ListBox.DataSource.RowCount.ToString
		        
		      End If
		    End Try
		    
		  End If
		  
		  'If row > Me.RowCount - 1 Then Return
		  '
		  'Select Case column
		  'Case 1
		  '
		  'Var theDialog As New Add_Task_WebDialog
		  'theDialog.New_Task_Record = New Physics_Tasking.CLASS_Task_Record
		  'theDialog.New_Task_Record.Task_Type_Record.id = Me.RowTagAt( row)
		  'theDialog.Show
		  '
		  'End Select
		End Sub
	#tag EndEvent
	#tag Event
		Sub DoublePressed(row as integer, column as integer)
		  
		  
		  If row > Me.RowCount - 1 Then Return
		  
		  Select Case column
		    
		  Case 0 To 4
		    
		    Var theDialog As New Modify_Plan_WebDialog
		    theDialog.plan_id = Me.RowTagAt( row)
		    theDialog.Show
		    
		  End Select
		  
		  
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Update_Timer
	#tag Event
		Sub Run()
		  If App.last_database_update <> Latest_UPDATE Then
		    
		    
		    My_Due_Plans_ListBox.ReloadData
		    Latest_Update = App.last_database_update
		    My_Plans_Label.Text = "Plans = " + My_Due_Plans_ListBox.DataSource.RowCount.ToString
		    
		  End If
		  
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Note_Label
	#tag Event
		Sub Opening()
		  Me.Style.ForegroundColor = Color.White
		  
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
