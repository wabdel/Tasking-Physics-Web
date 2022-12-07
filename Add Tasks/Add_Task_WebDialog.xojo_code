#tag WebPage
Begin WebDialog Add_Task_WebDialog
   Compatibility   =   ""
   ControlID       =   ""
   Enabled         =   True
   Height          =   592
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
   Width           =   1196
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
      Left            =   1058
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
      Top             =   534
      Visible         =   True
      Width           =   100
      _mPanelIndex    =   -1
   End
   Begin WebButton Add_Button
      AllowAutoDisable=   False
      Cancel          =   False
      Caption         =   "Add"
      ControlID       =   ""
      Default         =   True
      Enabled         =   True
      Height          =   38
      Index           =   -2147483648
      Indicator       =   1
      Left            =   548
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
      Top             =   534
      Visible         =   True
      Width           =   100
      _mPanelIndex    =   -1
   End
   Begin WebTextArea Notes_TextArea
      AllowReturnKey  =   True
      AllowSpellChecking=   False
      Caption         =   ""
      ControlID       =   ""
      Enabled         =   True
      Height          =   115
      Hint            =   ""
      Index           =   -2147483648
      Indicator       =   0
      Left            =   375
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      MaximumCharactersAllowed=   0
      ReadOnly        =   False
      Scope           =   2
      TabIndex        =   2
      Text            =   ""
      TextAlignment   =   0
      Tooltip         =   ""
      Top             =   383
      Visible         =   True
      Width           =   683
      _mPanelIndex    =   -1
   End
   Begin WebLabel Task_Type_Label
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
      Scope           =   2
      TabIndex        =   3
      Text            =   "Add Task:"
      TextAlignment   =   3
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   118
      Underline       =   False
      Visible         =   True
      Width           =   108
      _mPanelIndex    =   -1
   End
   Begin WebLabel Task_Group_Label
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
      Scope           =   2
      TabIndex        =   4
      Text            =   "Add Group:"
      TextAlignment   =   3
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   164
      Underline       =   False
      Visible         =   True
      Width           =   108
      _mPanelIndex    =   -1
   End
   Begin WebDatePicker Task_DatePicker
      AllowKeyboardEntry=   True
      ControlID       =   ""
      EarliestDate    =   ""
      Enabled         =   True
      Height          =   38
      Index           =   -2147483648
      Indicator       =   0
      InitialValue    =   ""
      LatestDate      =   ""
      Left            =   143
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      Scope           =   2
      TabIndex        =   5
      Tooltip         =   ""
      Top             =   227
      Visible         =   True
      Width           =   120
      _mPanelIndex    =   -1
   End
   Begin WebLabel Date_Label
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
      Scope           =   2
      TabIndex        =   6
      Text            =   "Date :"
      TextAlignment   =   3
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   227
      Underline       =   False
      Visible         =   True
      Width           =   108
      _mPanelIndex    =   -1
   End
   Begin WebLabel Multiplier_Label
      Bold            =   False
      ControlID       =   ""
      Enabled         =   True
      FontName        =   ""
      FontSize        =   0.0
      Height          =   38
      Index           =   -2147483648
      Indicator       =   0
      Italic          =   False
      Left            =   267
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
      Text            =   "Multiplier:"
      TextAlignment   =   3
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   283
      Underline       =   False
      Visible         =   True
      Width           =   108
      _mPanelIndex    =   -1
   End
   Begin WebTextField Multiplier_TextField
      AllowAutoComplete=   False
      AllowSpellChecking=   False
      Caption         =   ""
      ControlID       =   ""
      Enabled         =   True
      FieldType       =   3
      Height          =   38
      Hint            =   ""
      Index           =   -2147483648
      Indicator       =   0
      Left            =   383
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      MaximumCharactersAllowed=   0
      ReadOnly        =   False
      Scope           =   2
      TabIndex        =   8
      Text            =   "1"
      TextAlignment   =   0
      Tooltip         =   ""
      Top             =   283
      Visible         =   True
      Width           =   75
      _mPanelIndex    =   -1
   End
   Begin WebTextField Task_Type_TextField
      AllowAutoComplete=   False
      AllowSpellChecking=   False
      Caption         =   ""
      ControlID       =   ""
      Enabled         =   True
      FieldType       =   0
      Height          =   38
      Hint            =   ""
      Index           =   -2147483648
      Indicator       =   0
      Left            =   143
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      MaximumCharactersAllowed=   0
      ReadOnly        =   True
      Scope           =   2
      TabIndex        =   9
      Text            =   ""
      TextAlignment   =   0
      Tooltip         =   ""
      Top             =   118
      Visible         =   True
      Width           =   437
      _mPanelIndex    =   -1
   End
   Begin WebTextField Task_Group_TextField
      AllowAutoComplete=   False
      AllowSpellChecking=   False
      Caption         =   ""
      ControlID       =   ""
      Enabled         =   True
      FieldType       =   0
      Height          =   38
      Hint            =   ""
      Index           =   -2147483648
      Indicator       =   0
      Left            =   143
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      MaximumCharactersAllowed=   0
      ReadOnly        =   True
      Scope           =   2
      TabIndex        =   10
      Text            =   ""
      TextAlignment   =   0
      Tooltip         =   ""
      Top             =   164
      Visible         =   True
      Width           =   437
      _mPanelIndex    =   -1
   End
   Begin WebLabel Notes_Label
      Bold            =   False
      ControlID       =   ""
      Enabled         =   True
      FontName        =   ""
      FontSize        =   0.0
      Height          =   38
      Index           =   -2147483648
      Indicator       =   0
      Italic          =   False
      Left            =   383
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      Multiline       =   False
      Scope           =   2
      TabIndex        =   11
      Text            =   "Notes"
      TextAlignment   =   1
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   337
      Underline       =   False
      Visible         =   True
      Width           =   100
      _mPanelIndex    =   -1
   End
   Begin WebLabel Description_Label
      Bold            =   False
      ControlID       =   ""
      Enabled         =   True
      FontName        =   ""
      FontSize        =   0.0
      Height          =   38
      Index           =   -2147483648
      Indicator       =   0
      Italic          =   False
      Left            =   714
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
      Text            =   "Instruction:"
      TextAlignment   =   3
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   72
      Underline       =   False
      Visible         =   True
      Width           =   100
      _mPanelIndex    =   -1
   End
   Begin WebTextArea Description_TextArea
      AllowReturnKey  =   True
      AllowSpellChecking=   False
      Caption         =   ""
      ControlID       =   ""
      Enabled         =   True
      Height          =   220
      Hint            =   ""
      Index           =   -2147483648
      Indicator       =   0
      Left            =   721
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      MaximumCharactersAllowed=   0
      ReadOnly        =   True
      Scope           =   2
      TabIndex        =   13
      Text            =   ""
      TextAlignment   =   0
      Tooltip         =   ""
      Top             =   118
      Visible         =   True
      Width           =   437
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
      Left            =   359
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
      Text            =   "Add task"
      TextAlignment   =   2
      TextColor       =   &cFF7E7900
      Tooltip         =   ""
      Top             =   20
      Underline       =   True
      Visible         =   True
      Width           =   478
      _mPanelIndex    =   -1
   End
   Begin WebLabel Weight_Label
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
      Scope           =   2
      TabIndex        =   15
      Text            =   "Weight:"
      TextAlignment   =   3
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   283
      Underline       =   False
      Visible         =   True
      Width           =   108
      _mPanelIndex    =   -1
   End
   Begin WebTextField Weight_TextField
      AllowAutoComplete=   False
      AllowSpellChecking=   False
      Caption         =   ""
      ControlID       =   ""
      Enabled         =   False
      FieldType       =   3
      Height          =   38
      Hint            =   ""
      Index           =   -2147483648
      Indicator       =   0
      Left            =   143
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      MaximumCharactersAllowed=   0
      ReadOnly        =   False
      Scope           =   2
      TabIndex        =   16
      Text            =   ""
      TextAlignment   =   0
      Tooltip         =   ""
      Top             =   283
      Visible         =   True
      Width           =   116
      _mPanelIndex    =   -1
   End
   Begin WebLabel Points_Label
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
      Scope           =   2
      TabIndex        =   17
      Text            =   "Points:"
      TextAlignment   =   3
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   333
      Underline       =   False
      Visible         =   True
      Width           =   108
      _mPanelIndex    =   -1
   End
   Begin WebTextField Points_TextField
      AllowAutoComplete=   False
      AllowSpellChecking=   False
      Caption         =   ""
      ControlID       =   ""
      Enabled         =   False
      FieldType       =   3
      Height          =   38
      Hint            =   ""
      Index           =   -2147483648
      Indicator       =   0
      Left            =   143
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      MaximumCharactersAllowed=   0
      ReadOnly        =   False
      Scope           =   2
      TabIndex        =   18
      Text            =   ""
      TextAlignment   =   0
      Tooltip         =   ""
      Top             =   333
      Visible         =   True
      Width           =   116
      _mPanelIndex    =   -1
   End
End
#tag EndWebPage

#tag WindowCode
	#tag Event
		Sub Opening()
		  
		  
		  
		  
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h21
		Private mTask_Type_id As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Task_Completion As DateTime
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mTask_Type_id
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mTask_Type_id = value
			  
			  Var sql as String = "SELECT physics_tasking.task_types.name AS name, " _
			  + "physics_tasking.task_groups.name AS group_name, " _
			  + "physics_tasking.task_types.instructions AS instructions, " _
			  + "physics_tasking.task_types.has_multiplier AS has_multiplier, " _
			  + "physics_tasking.task_types.weight AS weight " _
			  + "FROM physics_tasking.task_types " _
			  + "INNER JOIN physics_tasking.task_groups USING(task_group_id) " _
			  + "WHERE physics_tasking.task_types.task_type_id = " +mTask_Type_id.ToString
			  
			  Var rs As RowSet = Physics_Tasking.DB_SELECT_Statement( sql)
			  
			  While Not rs.AfterLastRow
			    
			    Task_Type_TextField.Text = rs.Column("name").StringValue.Trim
			    
			    Task_Group_TextField.Text = rs.Column("group_name").StringValue.Trim.Uppercase
			    
			    Description_TextArea.Text = rs.Column("instructions").StringValue.Trim
			    
			    Weight_TextField.Text = Format( rs.Column("weight").DoubleValue, "#0.00")
			    
			    If rs.Column("has_multiplier").BooleanValue Then
			      
			      Multiplier_TextField.Enabled = True
			      
			    Else
			      
			      Multiplier_TextField.Enabled = False
			      
			      
			    End If
			    
			    Points_TextField.Text = Format( Weight_TextField.Text.ToDouble * Multiplier_TextField.Text.ToDouble, "#0.00")
			    Task_Completion = DateTime.Now
			    
			    Task_DatePicker.SelectedDate = Task_Completion
			    
			    rs.MoveToNextRow
			    
			  Wend
			  
			End Set
		#tag EndSetter
		Task_Type_id As Integer
	#tag EndComputedProperty


#tag EndWindowCode

#tag Events Cancel_Button
	#tag Event
		Sub Pressed()
		  Self.Close
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Add_Button
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
		      db.Prepare("INSERT INTO tasks (task_type_id, " _
		      + "user_id, " _
		      + "completion_date, " _
		      + "multiplier, " _
		      + "notes) " _
		      +"VALUES ( ?, ?, ?, ?, ?)")
		      
		      ps.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_LONG)
		      ps.BindType(1, MySQLPreparedStatement.MYSQL_TYPE_LONG)
		      ps.BindType(2, MySQLPreparedStatement.MYSQL_TYPE_DATETIME)
		      ps.BindType(3, MySQLPreparedStatement.MYSQL_TYPE_LONG)
		      ps.BindType(4, MySQLPreparedStatement.MYSQL_TYPE_STRING)
		      
		      
		      
		      
		      
		      ps.ExecuteSQL( _
		      Task_Type_id, _
		      Session.Logged_in_User.id, _
		      Task_Completion, _
		      Multiplier_TextField.Text.ToInteger, _
		      Notes_TextArea.Text)
		      
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
#tag Events Task_DatePicker
	#tag Event
		Sub DateChanged()
		  Task_Completion = Me.SelectedDate
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Multiplier_TextField
	#tag Event
		Sub TextChanged()
		  If Me.Text.ToInteger = 0 Then
		    
		    Add_Button.Enabled = False
		    Add_Button.Indicator = WebUIControl.Indicators.Light
		    
		  Else
		    
		    Add_Button.Enabled = True
		    Add_Button.Indicator = WebUIControl.Indicators.Primary
		    
		  End If
		  Points_TextField.Text = Format( Weight_TextField.Text.ToDouble * Multiplier_TextField.Text.ToDouble, "#0.00")
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
		Name="Task_Type_id"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
