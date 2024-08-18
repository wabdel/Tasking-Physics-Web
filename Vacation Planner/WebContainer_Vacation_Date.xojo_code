#tag WebContainerControl
Begin WebContainer WebContainer_Vacation_Date
   Compatibility   =   ""
   ControlCount    =   0
   ControlID       =   ""
   Enabled         =   True
   Height          =   120
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
   Width           =   180
   _mDesignHeight  =   0
   _mDesignWidth   =   0
   _mPanelIndex    =   -1
   Begin WebLabel Month_Label
      Bold            =   False
      ControlID       =   ""
      Enabled         =   True
      FontName        =   ""
      FontSize        =   0.0
      Height          =   30
      Index           =   -2147483648
      Indicator       =   0
      Italic          =   False
      Left            =   137
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   True
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      LockVertical    =   True
      Multiline       =   False
      PanelIndex      =   0
      Scope           =   2
      TabIndex        =   0
      TabStop         =   True
      Text            =   "Jun"
      TextAlignment   =   3
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   0
      Underline       =   False
      Visible         =   True
      Width           =   35
      _mPanelIndex    =   -1
   End
   Begin WebLabel Date_Label
      Bold            =   False
      ControlID       =   ""
      Enabled         =   True
      FontName        =   ""
      FontSize        =   0.0
      Height          =   30
      Index           =   -2147483648
      Indicator       =   0
      Italic          =   False
      Left            =   106
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
      Text            =   "23"
      TextAlignment   =   2
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   0
      Underline       =   False
      Visible         =   True
      Width           =   30
      _mPanelIndex    =   -1
   End
   Begin WebTimer Timer_UPDATE
      ControlID       =   ""
      Enabled         =   True
      Index           =   -2147483648
      Location        =   0
      LockedInPosition=   False
      PanelIndex      =   0
      Period          =   1000
      RunMode         =   2
      Scope           =   0
      _mPanelIndex    =   -1
   End
End
#tag EndWebContainerControl

#tag WindowCode
	#tag Event
		Sub Opening()
		  Me.Style.BackgroundColor = Design_Palette.COLOR_Surface_Primary
		  Me.Style.BorderThickness = 1
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Shown()
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub DRAW_Date()
		  Draw_Vacations
		  
		  
		  If is_Calinder_Month Then 
		    Date_Label.Style.ForegroundColor = Design_Palette.COLOR_Foreground
		    Month_Label.Style.ForegroundColor = Design_Palette.COLOR_Foreground
		    Self.Style.BackgroundColor = Design_Palette.COLOR_Background
		  Else
		    
		    Date_Label.Style.ForegroundColor = &c5E5E5E00
		    Month_Label.Style.ForegroundColor = &c3E424B
		    Self.Style.BackgroundColor = Design_Palette.COLOR_Background
		    
		    
		  End If
		  
		  Select Case mmy_date.DayOfWeek
		  Case 6, 7
		    
		    Self.Style.BackgroundColor =&c3E424B
		    
		  Else
		    
		    
		  End Select
		  
		  Date_Label.Text = mmy_date.Day.ToString
		  Date_Label.Top =  0
		  Date_Label.Left = 180 - 5 - Date_Label.Width
		  Month_Label.Visible = False
		  
		  If mmy_date.Day = 1 Then
		    
		    Month_Label.Text = Date_Module.Get_Month_Abbr( mmy_date.Month)
		    Month_Label.Visible = True
		    
		    Date_Label.Left = Month_Label.Left - Date_Label.Width - 5
		    
		  End If
		  
		  Date_Label.Style.BackgroundColor = Self.Style.BackgroundColor
		  Date_Label.Style.Value( "border") = "none;"
		  Date_Label.Style.Value("border-radius") =  Date_Label.Width.ToString + "px;"
		  
		  If mmy_date.day <> DateTime.Now.Day Then Return
		  If mmy_date.Month <> DateTime.Now.Month Then Return
		  If mmy_date.year <> DateTime.Now.Year Then Return
		  
		  Date_Label.Style.BackgroundColor = &cFF3B3B
		  Date_Label.Style.ForegroundColor = Color.Black
		  Date_Label.Style.Value( "border") = "1px solid #FF3B3B;"
		  Date_Label.Style.Value("border-radius") =  Date_Label.Width.ToString + "px;"
		  
		  
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Draw_Vacations()
		  
		  
		  For i As Integer = Vacation_Status_WEBCONTAINER.LastIndex To 0 Step -1
		    
		    Vacation_Status_WEBCONTAINER(i).Close
		    
		  Next
		  
		  Var sql As String = "SELECT user_id, initials " _
		  + "FROM physics_tasking.vacations " _
		  + "INNER JOIN physics_tasking.users USING (user_id) " _
		  + "WHERE start_date <= '" + mmy_date.SQLDate + "' " _
		  + "AND end_date >= '" + mmy_date.SQLDate + "';"
		  
		  Var rs As RowSet = Physics_Tasking.SELECT_Statement( sql)
		  
		  If rs.RowCount = 0 Then Return
		  
		  Vacation_Status_WEBCONTAINER.ResizeTo(-1)
		  
		  status_left_position = Self.Width  - 35
		  status_top_position = Self.Height - 30
		  
		  
		  
		  While Not rs.AfterLastRow
		    
		    Vacation_Status_WEBCONTAINER.Add (New WEBCONTAINER_Vacation_Status)
		    
		    Vacation_Status_WEBCONTAINER( Vacation_Status_WEBCONTAINER.LastIndex).EmbedWithin( Self, _
		    status_left_position, status_top_position, _
		    Vacation_Status_WEBCONTAINER( Vacation_Status_WEBCONTAINER.LastIndex).Width, _
		    Vacation_Status_WEBCONTAINER( Vacation_Status_WEBCONTAINER.LastIndex).Height)
		    
		    Vacation_Status_WEBCONTAINER( Vacation_Status_WEBCONTAINER.LastIndex).user_id = _
		    rs.Column("user_id").IntegerValue
		    
		    Vacation_Status_WEBCONTAINER( Vacation_Status_WEBCONTAINER.LastIndex).date = _
		    mmy_date
		    
		    
		    
		    Vacation_Status_WEBCONTAINER( Vacation_Status_WEBCONTAINER.LastIndex).Initials_Label.Text = _
		    rs.Column("initials").StringValue.Trim.Uppercase
		    
		    Var c_group As New ColorGroup( Design_Palette.COLOR_Warning)
		    Vacation_Status_WEBCONTAINER(Vacation_Status_WEBCONTAINER.LastIndex).Initials_Label.Style.ForegroundColor = Design_Palette.COLOR_Warning
		    Vacation_Status_WEBCONTAINER(Vacation_Status_WEBCONTAINER.LastIndex).Initials_Label.Style.BorderColor = c_group
		    Vacation_Status_WEBCONTAINER(Vacation_Status_WEBCONTAINER.LastIndex).Initials_Label.Style.BorderThickness = 1
		    Vacation_Status_WEBCONTAINER(Vacation_Status_WEBCONTAINER.LastIndex).Initials_Label.Style.FontSize = 12
		    Vacation_Status_WEBCONTAINER(Vacation_Status_WEBCONTAINER.LastIndex).Initials_Label.Style.Value("border-radius") =  "50px 50px;"
		    Var c1 As String = "#" +Design_Palette.COLOR_Secondary.ToString.Right(6)
		    Var c2 As String = "#" +Design_Palette.COLOR_On_Secondary.ToString.Right(6)
		    
		    'Vacation_Status_WEBCONTAINER(Vacation_Status_WEBCONTAINER.LastIndex).Initials_Label.Style.Value("text-align") = "center;"
		    'Vacation_Status_WEBCONTAINER(Vacation_Status_WEBCONTAINER.LastIndex).Initials_Label.Style.Value("font-size") = "12px;"
		    'Vacation_Status_WEBCONTAINER(Vacation_Status_WEBCONTAINER.LastIndex).Initials_Label.Style.Value("color") = "white" //"#212121" //"white"
		    'Vacation_Status_WEBCONTAINER(Vacation_Status_WEBCONTAINER.LastIndex).Initials_Label.Style.Value("text-shadow") =  "2px 2px 4px #000000;"
		    '
		    '
		    '
		    '
		    'Var c1 As String = "#" +Design_Palette.COLOR_Primary_Variant.ToString.Right(6)
		    'Var c2 As String = "#" +Design_Palette.COLOR_Error.ToString.Right(6)
		    'Var c3 As String = "#" +Design_Palette.COLOR_Warning.ToString.Right(6)
		    '
		    'Vacation_Status_WEBCONTAINER(Vacation_Status_WEBCONTAINER.LastIndex).Style.Value("background") = c1
		    'Vacation_Status_WEBCONTAINER(Vacation_Status_WEBCONTAINER.LastIndex).Style.Value("box-shadow") =  "1px 1px 1px white"
		    '
		    'Vacation_Status_WEBCONTAINER(Vacation_Status_WEBCONTAINER.LastIndex).Style.Value("border-radius") =  "50px 50px;"
		    
		    status_left_position = status_left_position - _
		    Vacation_Status_WEBCONTAINER( Vacation_Status_WEBCONTAINER.LastIndex).Width - 5
		    
		    rs.MoveToNextRow
		    
		  Wend 
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private Calendar_month As DateTime
	#tag EndProperty

	#tag Property, Flags = &h0
		is_Calinder_Month As Boolean = False
	#tag EndProperty

	#tag Property, Flags = &h21
		Private LATEST_UPDATE As DateTime
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mmy_date As DateTime
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mmy_date
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mmy_date = value
			  
			  
			End Set
		#tag EndSetter
		my_date As DateTime
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private status_left_position As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private status_top_position As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private user_id As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Vacation_Status_WEBCONTAINER() As WEBCONTAINER_Vacation_Status
	#tag EndProperty


#tag EndWindowCode

#tag Events Month_Label
	#tag Event
		Sub Opening()
		  Me.Style.ForegroundColor = Design_Palette.COLOR_Foreground
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Date_Label
	#tag Event
		Sub Opening()
		  Me.Style.ForegroundColor = Design_Palette.COLOR_Foreground
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Timer_UPDATE
	#tag Event
		Sub Run()
		  If LATEST_UPDATE <> APP.last_database_update Then
		    
		    
		    'DRAW_Buttom
		    
		    LATEST_UPDATE = App.last_database_update
		    
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
		Name="is_Calinder_Month"
		Visible=false
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
