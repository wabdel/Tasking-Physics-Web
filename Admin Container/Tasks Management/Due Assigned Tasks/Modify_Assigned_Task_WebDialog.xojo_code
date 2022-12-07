#tag WebPage
Begin WebDialog Modify_Assigned_Task_WebDialog
   Compatibility   =   ""
   ControlID       =   ""
   Enabled         =   True
   Height          =   494
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
   TabIndex        =   0
   Top             =   0
   Visible         =   True
   Width           =   876
   _mDesignHeight  =   0
   _mDesignWidth   =   0
   _mName          =   ""
   _mPanelIndex    =   -1
   Begin WebButton Cancel_Button
      AllowAutoDisable=   False
      Cancel          =   True
      Caption         =   "Cancel"
      ControlID       =   ""
      Default         =   False
      Enabled         =   True
      Height          =   38
      Index           =   -2147483648
      Indicator       =   0
      Left            =   756
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      Scope           =   2
      TabIndex        =   1
      Tooltip         =   ""
      Top             =   436
      Visible         =   True
      Width           =   100
      _mPanelIndex    =   -1
   End
   Begin WebButton Modify_Button
      AllowAutoDisable=   False
      Cancel          =   False
      Caption         =   "Modify"
      ControlID       =   ""
      Default         =   True
      Enabled         =   True
      Height          =   38
      Index           =   -2147483648
      Indicator       =   1
      Left            =   388
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      Scope           =   2
      TabIndex        =   2
      Tooltip         =   ""
      Top             =   436
      Visible         =   True
      Width           =   100
      _mPanelIndex    =   -1
   End
   Begin WebDatePicker Due_Date_DatePicker
      AllowKeyboardEntry=   False
      ControlID       =   ""
      EarliestDate    =   ""
      Enabled         =   True
      Height          =   38
      Index           =   -2147483648
      Indicator       =   0
      InitialValue    =   ""
      LatestDate      =   ""
      Left            =   156
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      Scope           =   2
      TabIndex        =   4
      Tooltip         =   ""
      Top             =   260
      Visible         =   True
      Width           =   150
      _mPanelIndex    =   -1
   End
   Begin WebLabel Due_Date_Label
      Bold            =   False
      ControlID       =   ""
      Enabled         =   True
      FontName        =   ""
      FontSize        =   0.0
      Height          =   38
      Index           =   -2147483648
      Indicator       =   0
      Italic          =   False
      Left            =   34
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      Multiline       =   False
      Scope           =   2
      TabIndex        =   7
      Text            =   "Due Date :"
      TextAlignment   =   3
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   260
      Underline       =   False
      Visible         =   True
      Width           =   100
      _mPanelIndex    =   -1
   End
   Begin WebLabel Machine_Label
      Bold            =   False
      ControlID       =   ""
      Enabled         =   True
      FontName        =   ""
      FontSize        =   0.0
      Height          =   38
      Index           =   -2147483648
      Indicator       =   0
      Italic          =   False
      Left            =   34
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      Multiline       =   False
      Scope           =   2
      TabIndex        =   9
      Text            =   "Machine :"
      TextAlignment   =   3
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   132
      Underline       =   False
      Visible         =   True
      Width           =   100
      _mPanelIndex    =   -1
   End
   Begin WebPopupMenu Machine_PopupMenu
      ControlID       =   ""
      Enabled         =   True
      Height          =   38
      Index           =   -2147483648
      Indicator       =   0
      InitialValue    =   ""
      LastAddedRowIndex=   0
      LastRowIndex    =   0
      Left            =   156
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      RowCount        =   0
      Scope           =   2
      SelectedRowIndex=   0
      SelectedRowValue=   ""
      TabIndex        =   10
      Tooltip         =   ""
      Top             =   132
      Visible         =   True
      Width           =   321
      _mPanelIndex    =   -1
   End
   Begin WebPopupMenu Schedulable_Tasks_PopupMenu
      ControlID       =   ""
      Enabled         =   True
      Height          =   38
      Index           =   -2147483648
      Indicator       =   0
      InitialValue    =   ""
      LastAddedRowIndex=   0
      LastRowIndex    =   0
      Left            =   156
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      RowCount        =   0
      Scope           =   2
      SelectedRowIndex=   0
      SelectedRowValue=   ""
      TabIndex        =   11
      Tooltip         =   ""
      Top             =   86
      Visible         =   True
      Width           =   700
      _mPanelIndex    =   -1
   End
   Begin WebLabel Assigned_Task_Label
      Bold            =   False
      ControlID       =   ""
      Enabled         =   True
      FontName        =   ""
      FontSize        =   0.0
      Height          =   38
      Index           =   -2147483648
      Indicator       =   0
      Italic          =   False
      Left            =   34
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      Multiline       =   False
      Scope           =   2
      TabIndex        =   12
      Text            =   "Task :"
      TextAlignment   =   3
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   86
      Underline       =   False
      Visible         =   True
      Width           =   100
      _mPanelIndex    =   -1
   End
   Begin WebLabel Title_Label
      Bold            =   False
      ControlID       =   ""
      Enabled         =   True
      FontName        =   ""
      FontSize        =   24.0
      Height          =   38
      Index           =   -2147483648
      Indicator       =   0
      Italic          =   False
      Left            =   199
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      Multiline       =   False
      Scope           =   2
      TabIndex        =   13
      Text            =   "Modify assigned task"
      TextAlignment   =   2
      TextColor       =   &cFF7E7900
      Tooltip         =   ""
      Top             =   20
      Underline       =   True
      Visible         =   True
      Width           =   478
      _mPanelIndex    =   -1
   End
   Begin WebLabel Planner_Label
      Bold            =   False
      ControlID       =   ""
      Enabled         =   True
      FontName        =   ""
      FontSize        =   0.0
      Height          =   38
      Index           =   -2147483648
      Indicator       =   0
      Italic          =   False
      Left            =   34
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      Multiline       =   False
      Scope           =   2
      TabIndex        =   14
      Text            =   "Planner :"
      TextAlignment   =   3
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   180
      Underline       =   False
      Visible         =   True
      Width           =   100
      _mPanelIndex    =   -1
   End
   Begin WebPopupMenu Staff_PopupMenu
      ControlID       =   ""
      Enabled         =   True
      Height          =   38
      Index           =   -2147483648
      Indicator       =   0
      InitialValue    =   ""
      LastAddedRowIndex=   0
      LastRowIndex    =   0
      Left            =   156
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      RowCount        =   0
      Scope           =   2
      SelectedRowIndex=   0
      SelectedRowValue=   ""
      TabIndex        =   15
      Tooltip         =   ""
      Top             =   178
      Visible         =   True
      Width           =   321
      _mPanelIndex    =   -1
   End
   Begin WebButton Delete_Button
      AllowAutoDisable=   False
      Cancel          =   True
      Caption         =   "Delete"
      ControlID       =   ""
      Default         =   False
      Enabled         =   True
      Height          =   38
      Index           =   -2147483648
      Indicator       =   4
      Left            =   34
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      Scope           =   0
      TabIndex        =   19
      Tooltip         =   ""
      Top             =   436
      Visible         =   True
      Width           =   100
      _mPanelIndex    =   -1
   End
   Begin WebMessageDialog dialog
      ControlID       =   ""
      Enabled         =   True
      Explanation     =   ""
      Index           =   -2147483648
      Indicator       =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      Message         =   ""
      Scope           =   0
      Title           =   ""
      Tooltip         =   ""
      _mPanelIndex    =   -1
   End
End
#tag EndWebPage

#tag WindowCode
	#tag Property, Flags = &h21
		Private mscheduled_task_id As Integer
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mscheduled_task_id
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mscheduled_task_id = value
			  
			  Var sql As String = "SELECT * FROM physics_tasking.scheduled_tasks " _
			  + "WHERE scheduled_task_id = " + mscheduled_task_id.ToString
			  
			  Var rs As RowSet = Physics_Tasking.DB_SELECT_Statement( sql)
			  
			  If rs.RowCount = 1 Then
			    
			    
			    Schedulable_Tasks_PopupMenu.SelectRowWithTag( rs.Column("task_type_id").IntegerValue)
			    
			    Machine_PopupMenu.SelectRowWithTag( rs.Column("machine_id").IntegerValue )
			    
			    Staff_PopupMenu.SelectRowWithTag( rs.Column("user_id").IntegerValue)
			    
			    
			    Due_Date_DatePicker.SelectedDate = rs.Column("due_date").DateTimeValue
			    
			  End If
			  
			End Set
		#tag EndSetter
		scheduled_task_id As Integer
	#tag EndComputedProperty


#tag EndWindowCode

#tag Events Cancel_Button
	#tag Event
		Sub Pressed()
		  Self.Close
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Modify_Button
	#tag Event
		Sub Pressed()
		  
		  Var db As New MySQLCommunityServer
		  
		  db.Host = Physics_Tasking.DB_Host
		  db.Port = Physics_Tasking.DB_Port
		  db.DatabaseName = Physics_Tasking.DB_DatabaseName
		  db.UserName = Physics_Tasking.DB_UserName
		  db.Password = Physics_Tasking.DB_Password
		  
		  
		  Try
		    
		    If db.Connect Then
		      
		      Var ps As  PreparedSQLStatement = _
		      db.Prepare("UPDATE scheduled_tasks SET task_type_id = ?, " _
		      + "machine_id = ?, " _
		      + "user_id = ?, " _
		      + "due_date = ? " _
		      + "WHERE " _
		      + "scheduled_task_id = ?")
		      
		      ps.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_LONG)
		      ps.BindType(1, MySQLPreparedStatement.MYSQL_TYPE_LONG)
		      ps.BindType(2, MySQLPreparedStatement.MYSQL_TYPE_LONG)
		      ps.BindType(3, MySQLPreparedStatement.MYSQL_TYPE_DATE)
		      ps.BindType(4, MySQLPreparedStatement.MYSQL_TYPE_LONG)
		      
		      
		      
		      
		      ps.ExecuteSQL( _
		      Schedulable_Tasks_PopupMenu.RowTagAt(Schedulable_Tasks_PopupMenu.SelectedRowIndex), _
		      Machine_PopupMenu.RowTagAt( Machine_PopupMenu.SelectedRowIndex), _
		      Staff_PopupMenu.RowTagAt( Staff_PopupMenu.SelectedRowIndex), _
		      Due_Date_DatePicker.SelectedDate, _
		      scheduled_task_id )
		      
		      
		      
		      App.last_database_update = DateTime.Now
		      
		      
		    End If
		    
		    Self.Close
		    
		  Catch de As DatabaseException
		    
		    Var theDialog As New MessageWebDialog
		    theDialog.Message_Label.Text = "Database error: (" + de.ErrorNumber.ToString + ") " + de.Message + "."
		    theDialog.Show
		    
		  Catch noe As NilObjectException
		    
		    Var theDialog As New MessageWebDialog
		    theDialog.Message_Label.Text = "Database error: (" + noe.ErrorNumber.ToString + ") " + noe.Message + "."
		    theDialog.Show
		    
		  End Try
		  
		  
		  
		  
		  
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Machine_PopupMenu
	#tag Event
		Sub Opening()
		  
		  Me.RemoveAllRows
		  
		  Var sql As String = "SELECT machine_id, name " _
		  + "FROM machines " _
		  + "ORDER BY name"
		  
		  Var rs As RowSet = Physics_Tasking.DB_SELECT_Statement(sql)
		  
		  While Not rs.AfterLastRow
		    
		    Me.AddRow( rs.Column("name").StringValue )
		    Me.RowTagAt( Me.LastAddedRowIndex) = rs.Column("machine_id").IntegerValue
		    
		    rs.MoveToNextRow
		    
		  Wend
		  
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Schedulable_Tasks_PopupMenu
	#tag Event
		Sub Opening()
		  Me.RemoveAllRows
		  
		  Var sql As String = "SELECT task_type_id, name " _
		  + "FROM task_types " _
		  + "WHERE is_schedulable = TRUE " _
		  + "ORDER BY name"
		  
		  Var rs As RowSet = Physics_Tasking.DB_SELECT_Statement(sql)
		  
		  While Not rs.AfterLastRow
		    
		    Me.AddRow( rs.Column("name").StringValue )
		    Me.RowTagAt( Me.LastAddedRowIndex) = rs.Column("task_type_id").IntegerValue
		    
		    rs.MoveToNextRow
		    
		  Wend
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Staff_PopupMenu
	#tag Event
		Sub Opening()
		  
		  Me.RemoveAllRows
		  
		  Var sql As String = "SELECT user_id, first_name, family_name " _
		  + "FROM users " _
		  + "WHERE category_id IN (2,3) " _
		  + "AND is_retired = FALSE " _
		  + "ORDER BY first_name, family_name"
		  
		  Var rs As RowSet = Physics_Tasking.DB_SELECT_Statement(sql)
		  
		  While Not rs.AfterLastRow
		    
		    Me.AddRow( rs.Column("first_name").StringValue.Trim.Titlecase + " " + rs.Column("family_name").StringValue.Trim.Uppercase )
		    Me.RowTagAt( Me.LastAddedRowIndex) = rs.Column("user_id").IntegerValue
		    
		    rs.MoveToNextRow
		    
		  Wend
		  
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Delete_Button
	#tag Event
		Sub Opening()
		  If Session.Logged_in_User.Group.id = 1 Then
		    
		    Me.Visible = True
		    Me.Enabled = True
		    
		  Else
		    
		    Me.Visible = False
		    Me.Enabled = False
		    
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Sub Pressed()
		  dialog.Message = "Do you want to delete this assigned task"
		  dialog.Explanation = "Caution: Delete in permanent. "
		  
		  dialog.ActionButton.Caption = "Delete"
		  dialog.ActionButton.Default = False
		  
		  dialog.CancelButton.Visible = True            
		  
		  dialog.Show
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events dialog
	#tag Event
		Sub ButtonPressed(button as WebMessageDialogButton)
		  
		  Select Case button
		  Case Me.ActionButton 
		    
		    Var sql As String = "DELETE FROM physics_tasking.scheduled_tasks " _
		    + "WHERE physics_tasking.scheduled_tasks.scheduled_task_id = " +scheduled_task_id.ToString + ";"
		    
		    Physics_Tasking.DB_EXECUTE_Statement(sql)
		    App.last_database_update = DateTime.Now
		    
		    
		    Self.Close
		    
		  Case Me.CancelButton //Cancelar
		    
		    MessageBox("Cancel")
		  End Select
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
		Name="scheduled_task_id"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
