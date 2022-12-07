#tag WebPage
Begin WebDialog WebDialog_TimeLog_Edit
   Compatibility   =   ""
   ControlID       =   ""
   Enabled         =   True
   Height          =   626
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
   Width           =   600
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
      Left            =   480
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
      Top             =   568
      Visible         =   True
      Width           =   100
      _mPanelIndex    =   -1
   End
   Begin WebButton Modify_Button
      AllowAutoDisable=   False
      Cancel          =   False
      Caption         =   "Save"
      ControlID       =   ""
      Default         =   True
      Enabled         =   True
      Height          =   38
      Index           =   -2147483648
      Indicator       =   1
      Left            =   250
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
      Top             =   568
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
      Left            =   61
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
      Text            =   "Edit timelog entry"
      TextAlignment   =   2
      TextColor       =   &cFF7E7900
      Tooltip         =   ""
      Top             =   20
      Underline       =   True
      Visible         =   True
      Width           =   478
      _mPanelIndex    =   -1
   End
   Begin WebDatePicker Date_DatePicker
      AllowKeyboardEntry=   True
      ControlID       =   ""
      EarliestDate    =   ""
      Enabled         =   True
      Height          =   38
      Index           =   -2147483648
      Indicator       =   0
      InitialValue    =   ""
      LatestDate      =   ""
      Left            =   225
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      Scope           =   2
      TabIndex        =   3
      Tooltip         =   ""
      Top             =   93
      Visible         =   True
      Width           =   150
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
      Left            =   117
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
      Text            =   "Date:"
      TextAlignment   =   3
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   93
      Underline       =   False
      Visible         =   True
      Width           =   100
      _mPanelIndex    =   -1
   End
   Begin WebRectangle Rectangle1
      BackgroundColor =   &cD6D6D680
      ControlID       =   ""
      Enabled         =   True
      HasBackgroundColor=   True
      Height          =   187
      Index           =   -2147483648
      Indicator       =   0
      LayoutDirection =   0
      LayoutType      =   0
      Left            =   40
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
      Top             =   139
      Visible         =   True
      Width           =   250
      _mDesignHeight  =   0
      _mDesignWidth   =   0
      _mPanelIndex    =   -1
      Begin WebLabel Time_In_Label
         Bold            =   False
         ControlID       =   ""
         Enabled         =   True
         FontName        =   ""
         FontSize        =   25.0
         Height          =   38
         Index           =   -2147483648
         Indicator       =   0
         Italic          =   True
         Left            =   60
         LockBottom      =   False
         LockedInPosition=   False
         LockHorizontal  =   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         LockVertical    =   False
         Multiline       =   False
         Parent          =   "Rectangle1"
         Scope           =   2
         TabIndex        =   6
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   "Time In"
         TextAlignment   =   2
         TextColor       =   &c00905100
         Tooltip         =   ""
         Top             =   159
         Underline       =   False
         Visible         =   True
         Width           =   210
         _mPanelIndex    =   -1
      End
      Begin WebSlider TimeIn_Slider
         ControlID       =   ""
         Enabled         =   True
         Height          =   20
         Index           =   -2147483648
         Indicator       =   0
         Left            =   60
         LockBottom      =   False
         LockedInPosition=   False
         LockHorizontal  =   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         LockVertical    =   False
         MaximumValue    =   96
         MinimumValue    =   0
         Parent          =   "Rectangle1"
         Scope           =   2
         StepValue       =   1
         TabIndex        =   9
         TabPanelIndex   =   0
         TabStop         =   True
         Tooltip         =   ""
         Top             =   286
         Value           =   0
         Visible         =   True
         Width           =   210
         _mPanelIndex    =   -1
      End
      Begin WebLabel Time_in
         Bold            =   False
         ControlID       =   ""
         Enabled         =   True
         FontName        =   ""
         FontSize        =   40.0
         Height          =   83
         Index           =   -2147483648
         Indicator       =   0
         Italic          =   False
         Left            =   60
         LockBottom      =   False
         LockedInPosition=   False
         LockHorizontal  =   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         LockVertical    =   False
         Multiline       =   False
         Parent          =   "Rectangle1"
         Scope           =   2
         TabIndex        =   10
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   "12:00"
         TextAlignment   =   2
         TextColor       =   &c00000000
         Tooltip         =   ""
         Top             =   195
         Underline       =   False
         Visible         =   True
         Width           =   210
         _mPanelIndex    =   -1
      End
   End
   Begin WebRectangle Rectangle2
      BackgroundColor =   &cD6D6D680
      ControlID       =   ""
      Enabled         =   True
      HasBackgroundColor=   True
      Height          =   187
      Index           =   -2147483648
      Indicator       =   0
      LayoutDirection =   0
      LayoutType      =   0
      Left            =   310
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      Scope           =   2
      TabIndex        =   7
      Tooltip         =   ""
      Top             =   139
      Visible         =   True
      Width           =   250
      _mDesignHeight  =   0
      _mDesignWidth   =   0
      _mPanelIndex    =   -1
      Begin WebLabel Time_Out_Label
         Bold            =   False
         ControlID       =   ""
         Enabled         =   True
         FontName        =   ""
         FontSize        =   25.0
         Height          =   38
         Index           =   -2147483648
         indicator       =   0
         Italic          =   True
         Left            =   330
         LockBottom      =   False
         LockedInPosition=   False
         LockHorizontal  =   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         LockVertical    =   False
         Multiline       =   False
         PanelIndex      =   "0"
         Parent          =   "Rectangle2"
         Scope           =   2
         TabIndex        =   8
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   "Time Out"
         TextAlignment   =   2
         TextColor       =   &cFF260000
         Tooltip         =   ""
         Top             =   159
         Underline       =   False
         Visible         =   True
         Width           =   210
         _mPanelIndex    =   -1
      End
      Begin WebLabel Time_out
         Bold            =   False
         ControlID       =   ""
         Enabled         =   True
         FontName        =   ""
         FontSize        =   40.0
         Height          =   83
         Index           =   -2147483648
         indicator       =   0
         Italic          =   False
         Left            =   330
         LockBottom      =   False
         LockedInPosition=   False
         LockHorizontal  =   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         LockVertical    =   False
         Multiline       =   False
         PanelIndex      =   "0"
         Parent          =   "Rectangle2"
         Scope           =   2
         TabIndex        =   9
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   "12:00"
         TextAlignment   =   2
         TextColor       =   &c00000000
         Tooltip         =   ""
         Top             =   195
         Underline       =   False
         Visible         =   True
         Width           =   210
         _mPanelIndex    =   -1
      End
      Begin WebSlider TimeOut_Slider
         ControlID       =   ""
         Enabled         =   True
         Height          =   20
         Index           =   -2147483648
         indicator       =   0
         Left            =   330
         LockBottom      =   False
         LockedInPosition=   False
         LockHorizontal  =   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         LockVertical    =   False
         MaximumValue    =   96
         MinimumValue    =   0
         PanelIndex      =   "0"
         Parent          =   "Rectangle2"
         Scope           =   2
         StepValue       =   1
         TabIndex        =   10
         TabPanelIndex   =   0
         TabStop         =   True
         Tooltip         =   ""
         Top             =   286
         Value           =   0
         Visible         =   True
         Width           =   210
         _mPanelIndex    =   -1
      End
   End
   Begin WebTextArea Notes_TextArea
      AllowReturnKey  =   True
      AllowSpellChecking=   False
      Caption         =   "Notes"
      ControlID       =   ""
      Enabled         =   True
      Height          =   121
      Hint            =   ""
      Index           =   -2147483648
      Indicator       =   ""
      Left            =   40
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      MaximumCharactersAllowed=   0
      ReadOnly        =   False
      Scope           =   0
      TabIndex        =   11
      Text            =   ""
      TextAlignment   =   0
      Tooltip         =   ""
      Top             =   412
      Visible         =   True
      Width           =   520
      _mPanelIndex    =   -1
   End
   Begin WebLabel Add_Subtract_Label
      Bold            =   False
      ControlID       =   ""
      Enabled         =   True
      FontName        =   ""
      FontSize        =   0.0
      Height          =   38
      Index           =   -2147483648
      Indicator       =   ""
      Italic          =   False
      Left            =   61
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
      Text            =   "Add/Subtract (hrs) ="
      TextAlignment   =   3
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   349
      Underline       =   False
      Visible         =   True
      Width           =   181
      _mPanelIndex    =   -1
   End
   Begin WebTextField Add_Subtract_TextField
      AllowAutoComplete=   False
      AllowSpellChecking=   False
      Caption         =   ""
      ControlID       =   ""
      Enabled         =   True
      FieldType       =   3
      Height          =   38
      Hint            =   ""
      Index           =   -2147483648
      Indicator       =   ""
      Left            =   250
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
      TabIndex        =   13
      Text            =   ""
      TextAlignment   =   0
      Tooltip         =   ""
      Top             =   349
      Visible         =   True
      Width           =   100
      _mPanelIndex    =   -1
   End
End
#tag EndWebPage

#tag WindowCode
	#tag Property, Flags = &h21
		Private mtimelog_id As Integer
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mtimelog_id
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mtimelog_id = value
			  
			  Var sql as String = "SELECT * FROM physics_tasking.timelogs " _
			  + "WHERE timelog_id = " + mtimelog_id.ToString
			  
			  Var rs As RowSet = Physics_Tasking.DB_SELECT_Statement(sql)
			  
			  If rs.RowCount = 1 Then
			    
			    Date_DatePicker.SelectedDate = New DateTime( _
			    rs.Column("time_in").DateTimeValue.Year, _
			    rs.Column("time_in").DateTimeValue.Month, _
			    rs.Column("time_in").DateTimeValue.Day)
			    
			    Var h As Integer = rs.Column("time_in").DateTimeValue.Hour
			    Var m As Integer = Round( rs.Column("time_in").DateTimeValue.Minute / 15)
			    
			    If m = 4 Then
			      
			      h = h +1
			      m = 0
			      
			    End If
			    
			    TimeIn_Slider.Value = h*4 + m
			    Time_in.Text = Format(h, "00") + " : " + Format( 15*m, "00")
			    
			    If Not (rs.Column("time_out").DateTimeValue = Nil ) Then
			      
			      h = rs.Column("time_out").DateTimeValue.Hour
			      m = Round( rs.Column("time_out").DateTimeValue.Minute / 15)
			      
			    Else
			      
			      Var d As DateTime = DateTime.Now
			      
			      h = d.Hour
			      m = Round( d.Minute / 15)
			      
			    End If
			    
			    If m = 4 Then
			      
			      h = h +1
			      m = 0
			      
			    End If
			    
			    TimeOut_Slider.Value = h*4 + m
			    Time_out.Text = Format(h, "00") + " : " + Format( 15*m, "00")
			    
			    
			    If Not rs.Column("notes").StringValue.IsEmpty  Then
			      
			      
			      Notes_TextArea.Text = rs.Column("notes").StringValue
			      
			    End If
			    
			  End If
			  
			  Add_Subtract_TextField.Text = Format( rs.Column("add_subtract").DoubleValue, "-#0.0")
			  
			End Set
		#tag EndSetter
		timelog_id As Integer
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
		      db.Prepare("UPDATE physics_tasking.timelogs " _
		      + "SET time_in = ?, " _
		      + "time_out = ?, " _
		      + "add_subtract = ?, " _
		      + "notes = ? " _
		      + "WHERE " _
		      + "timelog_id = ?")
		      
		      ps.BindType(0, MySQLPreparedStatement.MYSQL_TYPE_DATETIME)
		      ps.BindType(1, MySQLPreparedStatement.MYSQL_TYPE_DATETIME)
		      ps.BindType(2, MySQLPreparedStatement.MYSQL_TYPE_DOUBLE)
		      ps.BindType(3, MySQLPreparedStatement.MYSQL_TYPE_STRING)
		      ps.BindType(4, MySQLPreparedStatement.MYSQL_TYPE_LONG)
		      
		      Var h As Integer = TimeIn_Slider.Value/4
		      
		      Var m As Integer = 15*(TimeIn_Slider.Value - 4 * h)
		      
		      Var d_in As New DateTime(Date_DatePicker.SelectedDate.Year, _
		      Date_DatePicker.SelectedDate.Month, _
		      Date_DatePicker.SelectedDate.Day, _
		      h, m)
		      
		      h = Timeout_Slider.Value/4
		      
		      m = 15*(TimeOut_Slider.Value - 4 * h)
		      
		      Var d_out As New DateTime(Date_DatePicker.SelectedDate.Year, _
		      Date_DatePicker.SelectedDate.Month, _
		      Date_DatePicker.SelectedDate.Day, _
		      h, m)
		      
		      ps.ExecuteSQL( _
		      d_in, _
		      d_out, _
		      Add_Subtract_TextField.Text.ToDouble, _
		      Notes_TextArea.Text, _
		      timelog_id )
		      
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
#tag Events Date_DatePicker
	#tag Event
		Sub Opening()
		  Me.SelectedDate = DateTime.Now
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events TimeIn_Slider
	#tag Event
		Sub ValueChanged()
		  Var h As Integer = Me.Value/4
		  
		  Var m As Integer = 15*(Me.Value - 4 * h)
		  
		  
		  Time_in.Text = Format(h, "00") + " : " + Format( m, "00")
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub Opening()
		  Var d As DateTime = DateTime.Now
		  
		  Var h As Integer = d.Hour
		  Var m As Integer = Round( d.Minute / 15)
		  
		  If m = 4 Then
		    
		    h = h +1
		    m = 0
		    
		  End If
		  
		  Me.Value = h*4 + m
		  
		  Time_in.Text = Format(h, "00") + " : " + Format( m, "00")
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events TimeOut_Slider
	#tag Event
		Sub ValueChanged()
		  Var h As Integer = Me.Value/4
		  
		  Var m As Integer = 15*(Me.Value - 4 * h)
		  
		  
		  Time_out.Text = Format(h, "00") + " : " + Format( m, "00")
		  
		  
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
		Name="timelog_id"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
