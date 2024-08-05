#tag WebContainerControl
Begin WebContainer WEBCONTAINER_Users Implements WebDataSource
   Compatibility   =   ""
   ControlCount    =   0
   ControlID       =   ""
   Enabled         =   True
   Height          =   610
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
   Begin WebListBox Users_ListBox
      ColumnCount     =   9
      ColumnWidths    =   ""
      ControlID       =   ""
      DefaultRowHeight=   49
      Enabled         =   True
      GridLineStyle   =   3
      HasBorder       =   True
      HasHeader       =   True
      HeaderHeight    =   0
      Height          =   524
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
      Width           =   1200
      _mPanelIndex    =   -1
   End
   Begin WebLabel Users_Label
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
      PanelIndex      =   0
      Scope           =   2
      TabIndex        =   1
      TabStop         =   True
      Text            =   "Users = 0"
      TextAlignment   =   3
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   552
      Underline       =   False
      Visible         =   True
      Width           =   100
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
   Begin WebButton Add_User_Button
      AllowAutoDisable=   False
      Cancel          =   False
      Caption         =   "Add User"
      ControlID       =   ""
      Default         =   False
      Enabled         =   True
      Height          =   38
      Index           =   -2147483648
      Indicator       =   6
      Left            =   570
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
      TabIndex        =   2
      TabStop         =   True
      Tooltip         =   ""
      Top             =   552
      Visible         =   True
      Width           =   135
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
      PanelIndex      =   0
      Scope           =   2
      TabIndex        =   3
      TabStop         =   True
      Text            =   "Double click a row to modify."
      TextAlignment   =   1
      TextColor       =   &cFF7E7900
      Tooltip         =   ""
      Top             =   552
      Underline       =   False
      Visible         =   True
      Width           =   285
      _mPanelIndex    =   -1
   End
End
#tag EndWebContainerControl

#tag WindowCode
	#tag Method, Flags = &h21
		Private Function ColumnData() As WebListboxColumnData()
		  // Part of the WebDataSource interface.
		  
		  // This method is called once when the control is first created
		  // Returns information about the columns themselves
		  
		  Var cols() As WebListboxColumnData
		  
		  Var col As WebListboxColumnData
		  
		  col = New WebListboxColumnData
		  col.DatabaseColumnName = "login" // the name of the field in your database or data source
		  col.Heading = "User" // the name that appears above the column
		  col.Sortable = False // Whether or not the column is sortable
		  'col.SortDirection = Weblistbox.SortDirections.Ascending // The default sort direction for the column
		  col.Width = "80"
		  cols.Add(col)
		  
		  col = New WebListboxColumnData
		  col.DatabaseColumnName = "full_name" // the name of the field in your database or data source
		  col.Heading = "Full Name" // the name that appears above the column
		  col.Sortable = False // Whether or not the column is sortable
		  'col.SortDirection = Weblistbox.SortDirections.Ascending // The default sort direction for the column
		  col.Width = "230"
		  cols.Add(col)
		  
		  col = New WebListboxColumnData
		  col.DatabaseColumnName = "initials" // the name of the field in your database or data source
		  col.Heading = "Initials" // the name that appears above the column
		  col.Sortable = False // Whether or not the column is sortable
		  'col.SortDirection = Weblistbox.SortDirections.Ascending // The default sort direction for the column
		  col.Width = "40"
		  cols.Add(col)
		  
		  'col = New WebListboxColumnData
		  'col.DatabaseColumnName = "hospital_id" // the name of the field in your database or data source
		  'col.Heading = "ID" // the name that appears above the column
		  'col.Sortable = False // Whether or not the column is sortable
		  ''col.SortDirection = Weblistbox.SortDirections.Ascending // The default sort direction for the column
		  'col.Width = "50"
		  'cols.Add(col)
		  
		  'col = New WebListboxColumnData
		  'col.DatabaseColumnName = "email" // the name of the field in your database or data source
		  'col.Heading = "E-mail" // the name that appears above the column
		  'col.Sortable = False // Whether or not the column is sortable
		  ''col.SortDirection = Weblistbox.SortDirections.Ascending // The default sort direction for the column
		  'col.Width = "250"
		  'cols.Add(col)
		  
		  col = New WebListboxColumnData
		  col.DatabaseColumnName = "extension" // the name of the field in your database or data source
		  col.Heading = "Ext." // the name that appears above the column
		  col.Sortable = False // Whether or not the column is sortable
		  'col.SortDirection = Weblistbox.SortDirections.Ascending // The default sort direction for the column
		  col.Width = "50"
		  cols.Add(col)
		  
		  col = New WebListboxColumnData
		  col.DatabaseColumnName = "mobile" // the name of the field in your database or data source
		  col.Heading = "Mobile" // the name that appears above the column
		  col.Sortable = False // Whether or not the column is sortable
		  'col.SortDirection = Weblistbox.SortDirections.Ascending // The default sort direction for the column
		  col.Width = "120"
		  cols.Add(col)
		  
		  col = New WebListboxColumnData
		  col.DatabaseColumnName = "group_name" // the name of the field in your database or data source
		  col.Heading = "Group" // the name that appears above the column
		  col.Sortable = False // Whether or not the column is sortable
		  'col.SortDirection = Weblistbox.SortDirections.Ascending // The default sort direction for the column
		  col.Width = "100"
		  cols.Add(col)
		  
		  col = New WebListboxColumnData
		  col.DatabaseColumnName = "is_active" // the name of the field in your database or data source
		  col.Heading = "Active" // the name that appears above the column
		  col.Sortable = False // Whether or not the column is sortable
		  'col.SortDirection = Weblistbox.SortDirections.Ascending // The default sort direction for the column
		  col.Width = "100"
		  cols.Add(col)
		  
		  col = New WebListboxColumnData
		  col.DatabaseColumnName = "is_retired" // the name of the field in your database or data source
		  col.Heading = "Retired" // the name that appears above the column
		  col.Sortable = False // Whether or not the column is sortable
		  'col.SortDirection = Weblistbox.SortDirections.Ascending // The default sort direction for the column
		  col.Width = "100"
		  cols.Add(col)
		  
		  col = New WebListboxColumnData
		  col.DatabaseColumnName = "reset_password" // the name of the field in your database or data source
		  col.Heading = "Resest Password" // the name that appears above the column
		  col.Sortable = False // Whether or not the column is sortable
		  'col.SortDirection = Weblistbox.SortDirections.Ascending // The default sort direction for the column
		  col.Width = "100"
		  cols.Add(col)
		  
		  Return cols// Part of the WebDataSource interface.
		  
		  // Part of the WebDataSource interface.
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function ColumnData1() As WebListboxColumnData()
		  // Part of the WebDataSource interface.
		  
		  // This method is called once when the control is first created
		  // Returns information about the columns themselves
		  
		  Var cols() As WebListboxColumnData
		  
		  Var col As WebListboxColumnData
		  
		  col = New WebListboxColumnData
		  col.DatabaseColumnName = "login" // the name of the field in your database or data source
		  col.Heading = "User" // the name that appears above the column
		  col.Sortable = False // Whether or not the column is sortable
		  'col.SortDirection = Weblistbox.SortDirections.Ascending // The default sort direction for the column
		  col.Width = "80"
		  cols.Add(col)
		  
		  col = New WebListboxColumnData
		  col.DatabaseColumnName = "full_name" // the name of the field in your database or data source
		  col.Heading = "Full Name" // the name that appears above the column
		  col.Sortable = False // Whether or not the column is sortable
		  'col.SortDirection = Weblistbox.SortDirections.Ascending // The default sort direction for the column
		  col.Width = "230"
		  cols.Add(col)
		  
		  col = New WebListboxColumnData
		  col.DatabaseColumnName = "initials" // the name of the field in your database or data source
		  col.Heading = "Initials" // the name that appears above the column
		  col.Sortable = False // Whether or not the column is sortable
		  'col.SortDirection = Weblistbox.SortDirections.Ascending // The default sort direction for the column
		  col.Width = "40"
		  cols.Add(col)
		  
		  col = New WebListboxColumnData
		  col.DatabaseColumnName = "hospital_id" // the name of the field in your database or data source
		  col.Heading = "ID" // the name that appears above the column
		  col.Sortable = False // Whether or not the column is sortable
		  'col.SortDirection = Weblistbox.SortDirections.Ascending // The default sort direction for the column
		  col.Width = "50"
		  cols.Add(col)
		  
		  col = New WebListboxColumnData
		  col.DatabaseColumnName = "email" // the name of the field in your database or data source
		  col.Heading = "E-mail" // the name that appears above the column
		  col.Sortable = False // Whether or not the column is sortable
		  'col.SortDirection = Weblistbox.SortDirections.Ascending // The default sort direction for the column
		  col.Width = "250"
		  cols.Add(col)
		  
		  col = New WebListboxColumnData
		  col.DatabaseColumnName = "extension" // the name of the field in your database or data source
		  col.Heading = "Ext." // the name that appears above the column
		  col.Sortable = False // Whether or not the column is sortable
		  'col.SortDirection = Weblistbox.SortDirections.Ascending // The default sort direction for the column
		  col.Width = "50"
		  cols.Add(col)
		  
		  col = New WebListboxColumnData
		  col.DatabaseColumnName = "mobile" // the name of the field in your database or data source
		  col.Heading = "Mobile" // the name that appears above the column
		  col.Sortable = False // Whether or not the column is sortable
		  'col.SortDirection = Weblistbox.SortDirections.Ascending // The default sort direction for the column
		  col.Width = "120"
		  cols.Add(col)
		  
		  col = New WebListboxColumnData
		  col.DatabaseColumnName = "group_name" // the name of the field in your database or data source
		  col.Heading = "Group" // the name that appears above the column
		  col.Sortable = False // Whether or not the column is sortable
		  'col.SortDirection = Weblistbox.SortDirections.Ascending // The default sort direction for the column
		  col.Width = "100"
		  cols.Add(col)
		  
		  col = New WebListboxColumnData
		  col.DatabaseColumnName = "is_active" // the name of the field in your database or data source
		  col.Heading = "Active" // the name that appears above the column
		  col.Sortable = False // Whether or not the column is sortable
		  'col.SortDirection = Weblistbox.SortDirections.Ascending // The default sort direction for the column
		  col.Width = "100"
		  cols.Add(col)
		  
		  col = New WebListboxColumnData
		  col.DatabaseColumnName = "is_retired" // the name of the field in your database or data source
		  col.Heading = "Retired" // the name that appears above the column
		  col.Sortable = False // Whether or not the column is sortable
		  'col.SortDirection = Weblistbox.SortDirections.Ascending // The default sort direction for the column
		  col.Width = "100"
		  cols.Add(col)
		  
		  col = New WebListboxColumnData
		  col.DatabaseColumnName = "reset_password" // the name of the field in your database or data source
		  col.Heading = "Resest Password" // the name that appears above the column
		  col.Sortable = False // Whether or not the column is sortable
		  'col.SortDirection = Weblistbox.SortDirections.Ascending // The default sort direction for the column
		  col.Width = "100"
		  cols.Add(col)
		  
		  Return cols// Part of the WebDataSource interface.
		  
		  // Part of the WebDataSource interface.
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function RowCount() As Integer
		  
		  Var sql As String = "SELECT COUNT(*) as c " _
		  + "FROM physics_tasking.users " _
		  + "WHERE user_id NOT IN (1) " _
		  + "ORDER BY first_name, family_name;"
		  
		  Var rs As RowSet = Physics_Tasking.SELECT_Statement( sql)
		  
		  
		  Return rs.Column("c").IntegerValue
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function RowData(RowCount as Integer, RowOffset as Integer, SortColumns as String) As WebListboxRowData()
		  // Part of the WebDataSource interface.
		  
		  
		  Var rows() As WebListboxRowData
		  Var sql As String = "SELECT physics_tasking.users.user_id AS user_id, " _
		  + "physics_tasking.users.login AS login, " _
		  + "physics_tasking.users.first_name AS first_name, " _
		  + "physics_tasking.users.family_name AS family_name, " _
		  + "physics_tasking.users.initials AS initials, " _
		  + "physics_tasking.users.email AS email, " _
		  + "physics_tasking.users.extension AS extension, " _
		  + "physics_tasking.users.is_active AS is_active, " _
		  + "physics_tasking.users.is_retired AS is_retired, " _
		  + "physics_tasking.users.reset_password AS reset_password, " _
		  + "physics_tasking.users.mobile AS mobile, " _
		  + "physics_tasking.categories.name AS group_name, " _
		  + "physics_tasking.users.hospital_id AS hospital_id " _
		  + "FROM physics_tasking.users " _
		  + "INNER JOIN categories USING(category_id) " _
		  + "WHERE user_id NOT IN (1) " _
		  + "ORDER BY first_name, family_name;"
		  
		  Var rs As RowSet = Physics_Tasking.SELECT_Statement( sql)
		  
		  Var active_buttons() As GroupButtonItem
		  active_buttons.Add(New GroupButtonItem("yes", "Yes", "success"))
		  active_buttons.Add(New GroupButtonItem("no", "NO", "secondary"))
		  
		  Var not_active_buttons() As GroupButtonItem
		  not_active_buttons.Add(New GroupButtonItem("yes", "Yes", "secondary"))
		  not_active_buttons.Add(New GroupButtonItem("no", "NO", "danger"))
		  
		  Var retired_buttons() As GroupButtonItem
		  retired_buttons.Add(New GroupButtonItem("yes", "Yes", "success"))
		  retired_buttons.Add(New GroupButtonItem("no", "NO", "secondary"))
		  
		  Var not_retired_buttons() As GroupButtonItem
		  not_retired_buttons.Add(New GroupButtonItem("yes", "Yes", "secondary"))
		  not_retired_buttons.Add(New GroupButtonItem("no", "NO", "danger"))
		  
		  Var reset_password_buttons() As GroupButtonItem
		  reset_password_buttons.Add(New GroupButtonItem("yes", "Yes", "success"))
		  reset_password_buttons.Add(New GroupButtonItem("no", "NO", "secondary"))
		  
		  Var not_reset_password_buttons() As GroupButtonItem
		  not_reset_password_buttons.Add(New GroupButtonItem("yes", "Yes", "secondary"))
		  not_reset_password_buttons.Add(New GroupButtonItem("no", "NO", "danger"))
		  
		  While Not rs.AfterLastRow
		    
		    Var s As New WebStyle
		    Var row As New WebListBoxRowData
		    row.PrimaryKey = rs.Column("user_id").IntegerValue
		    row.Tag = rs.Column("user_id").IntegerValue
		    
		    Var cellRenderer As New WebListBoxStyleRenderer(s, rs.Column("login").StringValue.Trim)
		    row.Value("login") = cellRenderer
		    
		    
		    cellRenderer = New WebListBoxStyleRenderer(s, _
		    rs.Column("first_name").StringValue.Trim.Titlecase + " " _
		    + rs.Column("family_name").StringValue.Trim.Uppercase)
		    row.Value("full_name") = cellRenderer
		    
		    cellRenderer = New WebListBoxStyleRenderer(s, rs.Column("initials").StringValue.Trim.Uppercase)
		    row.Value("initials") = cellRenderer
		    
		    'cellRenderer = New WebListBoxStyleRenderer(s, rs.Column("hospital_id").StringValue.Trim.Uppercase)
		    'row.Value("hospital_id") = cellRenderer
		    
		    'cellRenderer = New WebListBoxStyleRenderer(s, rs.Column("email").StringValue.Trim.Uppercase)
		    'row.Value("email") = cellRenderer
		    
		    cellRenderer = New WebListBoxStyleRenderer(s, rs.Column("extension").StringValue.Trim.Uppercase)
		    row.Value("extension") = cellRenderer
		    
		    cellRenderer = New WebListBoxStyleRenderer(s, rs.Column("mobile").StringValue.Trim.Uppercase)
		    row.Value("mobile") = cellRenderer
		    
		    cellRenderer = New WebListBoxStyleRenderer(s, rs.Column("group_name").StringValue.Trim.Uppercase)
		    row.Value("group_name") = cellRenderer
		    
		    If rs.Column("is_active").BooleanValue Then
		      
		      row.Value("is_active") = New GroupButtonsCellRenderer(active_buttons)
		    Else
		      row.Value("is_active") = New GroupButtonsCellRenderer(not_active_buttons)
		      
		    End If
		    
		    If rs.Column("is_retired").BooleanValue Then
		      
		      row.Value("is_retired") = New GroupButtonsCellRenderer(retired_buttons)
		    Else
		      row.Value("is_retired") = New GroupButtonsCellRenderer(not_retired_buttons)
		      
		    End If
		    
		    If rs.Column("reset_password").BooleanValue Then
		      
		      row.Value("reset_password") = New GroupButtonsCellRenderer(reset_password_buttons)
		    Else
		      row.Value("reset_password") = New GroupButtonsCellRenderer(not_reset_password_buttons)
		      
		    End If
		    rows.Add(row)
		    
		    rs.MoveToNextRow
		  Wend
		  
		  
		  
		  Return rows// Part of the WebDataSource interface.
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function SortedPrimaryKeys(sortColumns as String) As Integer()
		  // Part of the WebDataSource interface.
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function UnsortedPrimaryKeys() As Integer()
		  Var keys() As Integer 
		  
		  Var sql As String = "SELECT physics_tasking.users.user_id AS user_id " _
		  + "FROM physics_tasking.users " _
		  + "WHERE user_id NOT IN (1) " _
		  + "ORDER BY first_name, family_name;"
		  
		  Var rs As RowSet = Physics_Tasking.SELECT_Statement( sql)
		  
		  While Not rs.AfterLastRow
		    keys.Append( rs.Column("user_id").IntegerValue)
		    
		    rs.MoveToNextRow
		  Wend
		  Return keys// Part of the WebDataSource interface.
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private Latest_UPDATE As DateTime
	#tag EndProperty


#tag EndWindowCode

#tag Events Users_ListBox
	#tag Event
		Sub Opening()
		  Me.HasHeader = True
		  Me.RowSelectionType = WebListBox.RowSelectionTypes.None
		  Me.DataSource = Self
		  Me.ReloadData
		End Sub
	#tag EndEvent
	#tag Event
		Sub DoublePressed(row As Integer, column As Integer)
		  
		  If row > Me.LastRowIndex Then Return
		  
		  Select Case column
		  Case 0 To 7
		    
		    Var theDialog As New WebDialog_User_Edit
		    theDialog.Show
		    theDialog.user_id = me.RowTagAt( row)
		    
		  End Select
		End Sub
	#tag EndEvent
	#tag Event
		Sub CustomCellAction(row As Integer, column As Integer, identifier As String, value As Variant)
		  If identifier = "GroupButtonPressed" Then
		    
		    
		    Var db As New MySQLCommunityServer
		    db.Host = Physics_Tasking.db_host
		    db.Port = Physics_Tasking.db_port
		    db.DatabaseName = Physics_Tasking.db_name
		    db.UserName = Physics_Tasking.db_username
		    db.Password = Physics_Tasking.db_password
		    
		    Try
		      
		      If db.Connect Then
		        
		        Var sql As String
		        
		        Select Case column
		        Case 6
		          
		          sql = "UPDATE  physics_tasking.users " _
		          + "SET is_active = NOT is_active " _
		          + "WHERE user_id = " + Me.RowTagAt( row)
		          
		          
		        Case 7
		          
		          sql = "UPDATE  physics_tasking.users " _
		          + "SET is_retired = NOT is_retired, " _
		          + " is_active = False " _
		          + "WHERE user_id = " + Me.RowTagAt( row)
		          
		        Case 8
		          
		          sql = "UPDATE  physics_tasking.users " _
		          + "SET reset_password = NOT reset_password " _
		          + "WHERE user_id = " + Me.RowTagAt( row)
		          
		          
		        End Select
		        db.ExecuteSQL(sql)
		        
		        App.last_database_update = DateTime.Now
		        Latest_Update = App.last_database_update
		        
		        Users_ListBox.ReloadData
		        Users_Label.Text = "Users = " + Users_ListBox.DataSource.RowCount.ToString
		      End If
		    End Try
		    
		  End If
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Users_Label
	#tag Event
		Sub Opening()
		  Me.Style.BackgroundColor = Design_Palette.COLOR_On_Primary
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events REFRESH_Timer
	#tag Event
		Sub Run()
		  
		  If App.last_database_update <> Latest_UPDATE Then
		    
		    Users_ListBox.ReloadData
		    Users_Label.Text = "Users = " + Users_ListBox.DataSource.RowCount.ToString
		    Latest_UPDATE = App.last_database_update
		    
		  End If
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Add_User_Button
	#tag Event
		Sub Pressed()
		  Var theDialog As New WebDialog_User_Add
		  theDialog.Show
		End Sub
	#tag EndEvent
	#tag Event
		Sub Opening()
		  Me.Style = Design_Palette.STYLE_BUTTON_Unpressed
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Note_Label
	#tag Event
		Sub Opening()
		  Me.Style.ForegroundColor = Design_Palette.COLOR_Note
		  
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
