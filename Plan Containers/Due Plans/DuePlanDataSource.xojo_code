#tag Class
Protected Class DuePlanDataSource
Implements WebDataSource
	#tag Method, Flags = &h21
		Private Function ColumnData() As WebListboxColumnData()
		  // Part of the WebDataSource interface.
		  
		  // This method is called once when the control is first created
		  // Returns information about the columns themselves
		  
		  Var cols() As WebListboxColumnData
		  
		  Var col As WebListboxColumnData
		  
		  col = New WebListboxColumnData
		  col.DatabaseColumnName = "mrn" // the name of the field in your database or data source
		  col.Heading = "MRN" // the name that appears above the column
		  col.Sortable = True // Whether or not the column is sortable
		  'col.SortDirection = Weblistbox.SortDirections.Ascending // The default sort direction for the column
		  col.Width = "70"
		  cols.Add(col)
		  
		  col = New WebListboxColumnData
		  col.DatabaseColumnName = "full_name" // the name of the field in your database or data source
		  col.Heading = "Full Name" // the name that appears above the column
		  col.Sortable = True // Whether or not the column is sortable
		  'col.SortDirection = Weblistbox.SortDirections.Ascending // The default sort direction for the column
		  col.Width = "170"
		  cols.Add(col)
		  
		  col = New WebListboxColumnData
		  col.DatabaseColumnName = "site" // the name of the field in your database or data source
		  col.Heading = "Site" // the name that appears above the column
		  col.Sortable = True // Whether or not the column is sortable
		  'col.SortDirection = Weblistbox.SortDirections.Ascending // The default sort direction for the column
		  col.Width = "80"
		  cols.Add(col)
		  
		  col = New WebListboxColumnData
		  col.DatabaseColumnName = "plan_type" // the name of the field in your database or data source
		  col.Heading = "Plan Type" // the name that appears above the column
		  col.Sortable = False // Whether or not the column is sortable
		  'col.SortDirection = Weblistbox.SortDirections.Ascending // The default sort direction for the column
		  col.Width = "230"
		  cols.Add(col)
		  
		  col = New WebListboxColumnData
		  col.DatabaseColumnName = "due_date" // the name of the field in your database or data source
		  col.Heading = "Due Date" // the name that appears above the column
		  col.Sortable = True // Whether or not the column is sortable
		  'col.SortDirection = Weblistbox.SortDirections.Ascending // The default sort direction for the column
		  col.Width = "200"
		  cols.Add(col)
		  
		  col = New WebListboxColumnData
		  col.DatabaseColumnName = "initials" // the name of the field in your database or data source
		  col.Heading = "Planner" // the name that appears above the column
		  col.Sortable = True // Whether or not the column is sortable
		  'col.SortDirection = Weblistbox.SortDirections.Ascending // The default sort direction for the column
		  col.Width = "70"
		  cols.Add(col)
		  
		  col = New WebListboxColumnData
		  col.DatabaseColumnName = "physician_initials" // the name of the field in your database or data source
		  col.Heading = "Physician" // the name that appears above the column
		  col.Sortable = True // Whether or not the column is sortable
		  'col.SortDirection = Weblistbox.SortDirections.Ascending // The default sort direction for the column
		  col.Width = "80"
		  cols.Add(col)
		  
		  Return cols// Part of the WebDataSource interface.
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function RowCount() As Integer
		  // Part of the WebDataSource interface.
		  
		  
		  Var sql As String = "SELECT COUNT(*) as c FROM physics_tasking.plans WHERE " _
		  + "physics_tasking.plans.is_completed = 0;"
		  
		  Var rs As RowSet = Physics_Tasking.SELECT_Statement( sql)
		  
		  
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
		  + "DATE(physics_tasking.plans.due_date) as due_date, " _
		  + "physics_tasking.users.initials As initials, " _
		  + "physics_tasking.plans.is_replan as is_replan, " _
		  + "(" _
		  + "SELECT physics_tasking.users.initials " _
		  + "FROM physics_tasking.users " _
		  + "WHERE physics_tasking.plans.physician_id = physics_tasking.users.user_id" _
		  +") As physician_initials " _
		  + "FROM physics_tasking.plans " _
		  + "INNER JOIN physics_tasking.patients USING (patient_id) " _
		  + "INNER JOIN physics_tasking.plan_types USING (plan_type_id) " _
		  + "INNER JOIN physics_tasking.sites USING (site_id) " _
		  + "INNER JOIN physics_tasking.users USING (user_id) " _
		  + "WHERE physics_tasking.plans.is_completed = 0 " _
		  + "ORDER BY "
		  
		  Select Case SortColumns
		  Case ""
		    
		    sql =sql + "DATE(physics_tasking.plans.due_date) ASC, physics_tasking.patients.mrn ASC"
		    
		  Case "initials asc"
		    
		    sql = sql + "physics_tasking.users.initials ASC, DATE(physics_tasking.plans.due_date) ASC, physics_tasking.patients.mrn ASC"
		    
		  Case "initials desc"
		    
		    sql = sql + "physics_tasking.users.initials DESC, DATE(physics_tasking.plans.due_date) DESC, physics_tasking.patients.mrn ASC"
		    
		  Case "physician_initials asc"
		    
		    sql = sql + "physician_initials ASC, DATE(physics_tasking.plans.due_date) ASC, physics_tasking.patients.mrn ASC"
		    
		  Case "physician_initials desc"
		    
		    sql = sql + "physician_initials DESC, DATE(physics_tasking.plans.due_date) DESC, physics_tasking.patients.mrn ASC"
		    
		  Case "due_date asc"
		    
		    sql = sql + "DATE(physics_tasking.plans.due_date) ASC, physics_tasking.patients.mrn ASC"
		    
		  Case "due_date desc"
		    
		    sql = sql + "DATE(physics_tasking.plans.due_date DESC), physics_tasking.patients.mrn ASC"
		    
		  Case "mrn asc"
		    
		    sql = sql + "physics_tasking.patients.mrn ASC, DATE(physics_tasking.plans.due_date ASC)"
		    
		  Case "mrn desc"
		    
		    sql = sql + "physics_tasking.patients.mrn DESC, DATE(physics_tasking.plans.due_date DESC)"
		    
		  Case "full_name asc"
		    
		    sql = sql + "physics_tasking.patients.first_name ASC, physics_tasking.patients.family_name ASC, DATE(physics_tasking.plans.due_date ASC)"
		    
		  Case "full_name desc"
		    
		    sql = sql + "physics_tasking.patients.first_name DESC, physics_tasking.patients.family_name DESC, DATE(physics_tasking.plans.due_date DESC)"
		    
		  Case "site asc"
		    
		    sql = sql + "physics_tasking.sites.name ASC, DATE(physics_tasking.plans.due_date) ASC, physics_tasking.patients.mrn ASC"
		    
		  Case "site desc"
		    
		    sql = sql + "physics_tasking.sites.name DESC, DATE(physics_tasking.plans.due_date) DESC, physics_tasking.patients.mrn ASC"
		    
		  End Select
		  
		  
		  
		  
		  
		  Var rs As RowSet = Physics_Tasking.SELECT_Statement( sql)
		  
		  While Not rs.AfterLastRow
		    
		    Var s As New WebStyle
		    
		    Select Case Physics_Tasking.Days_To_Start_Date( rs.Column("due_date").DateValue)
		    Case Is <= 1
		      
		      's.BackgroundColor = Theme_Colors.Color_Palette.Fail //Color.Red
		      s.BackgroundColor = Design_Palette.COLOR_Error
		      s.ForegroundColor = Design_Palette.COLOR_On_Error
		      's.Bold = True
		      
		    Case 2 To 3
		      
		      
		      s.BackgroundColor = Design_Palette.COLOR_Warning
		      s.ForegroundColor = Design_Palette.COLOR_On_Warning
		      
		      's.BackgroundColor = Theme_Colors.Color_Palette.Caution //Color.Orange
		      's.Bold = True
		      
		    Else
		      
		      s.BackgroundColor = Design_Palette.COLOR_Background
		      s.ForegroundColor = Design_Palette.COLOR_On_Background
		      
		    End Select
		    
		    
		    Var row As New WebListBoxRowData
		    row.PrimaryKey = rs.Column("plan_id").IntegerValue
		    
		    Var cellRenderer As New WebListBoxStyleRenderer(s, rs.Column("mrn").StringValue.Trim)
		    row.Value("mrn") = cellRenderer
		    
		    cellRenderer = New WebListBoxStyleRenderer(s, _
		    rs.Column("first_name").StringValue.Trim.Titlecase + " " _
		    + rs.Column("family_name").StringValue.Trim.Uppercase)
		    row.Value("full_name") = cellRenderer
		    
		    If rs.Column("is_uppercase").BooleanValue Then
		      
		      cellRenderer = New WebListBoxStyleRenderer(s, rs.Column("site").StringValue.Trim.Uppercase)
		      
		    Else
		      
		      cellRenderer = New WebListBoxStyleRenderer(s, rs.Column("site").StringValue.Trim.Titlecase)
		      
		    End If
		    
		    row.Value("site") = cellRenderer
		    
		    If rs.Column("is_replan").BooleanValue Then
		      
		      cellRenderer = New WebListBoxStyleRenderer(s, rs.Column("plan_type_name").StringValue.Trim + " (R)") 
		      
		    Else
		      
		      cellRenderer = New WebListBoxStyleRenderer(s, rs.Column("plan_type_name").StringValue.Trim) 
		      
		    End If
		    row.Value("plan_type") = cellRenderer
		    
		    Var d As DateTime = rs.Column("due_date").DateValue
		    cellRenderer = New WebListBoxStyleRenderer(s, _
		    d.ToString(Locale.Current, DateTime.FormatStyles.Full, DateTime.FormatStyles.None))
		    
		    row.Value("due_date") = cellRenderer
		    
		    
		    cellRenderer = New WebListBoxStyleRenderer(s, rs.Column("initials").StringValue.Trim.Uppercase)
		    row.Value("initials") = cellRenderer
		    
		    cellRenderer = New WebListBoxStyleRenderer(s, rs.Column("physician_initials").StringValue.Trim.Uppercase)
		    row.Value("physician_initials") = cellRenderer
		    rows.Add(row)
		    
		    rs.MoveToNextRow
		  Wend
		  rs.Close
		  
		  Return rows
		  
		  
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function SortedPrimaryKeys(sortColumns as String) As Integer()
		  // Part of the WebDataSource interface.
		  
		  // This method is used for maintaining the selected rows list on the client
		  
		  Static lastSortOrder As String = ""
		  Static lastFilter As String = ""
		  
		  // If the sort order has changed, reset the array so the data is re-pulled
		  If lastSortOrder <> sortColumns Then
		    lastSortOrder = sortColumns
		    
		    Redim mSortedKeys(-1)
		  End If
		  
		  If mSortedKeys = Nil Or UBound(mSortedKeys) = -1 Then
		    
		    Var keys() As Integer
		    
		    Var sql As String = "SELECT physics_tasking.plans.plan_id AS plan_id, " _
		    + "(" _
		    + "SELECT physics_tasking.users.initials " _
		    + "FROM physics_tasking.users " _
		    + "WHERE physics_tasking.plans.physician_id = physics_tasking.users.user_id" _
		    +") As physician_initials " _
		    + "FROM physics_tasking.plans " _
		    + "INNER JOIN physics_tasking.patients USING(patient_id) " _
		    + "INNER JOIN physics_tasking.plan_types USING(plan_type_id) " _
		    + "INNER JOIN physics_tasking.sites USING(site_id) " _
		    + "INNER JOIN physics_tasking.users USING(user_id) " _
		    + "WHERE physics_tasking.plans.is_completed = 0 " _
		    + "ORDER BY " 
		    
		    Select Case sortColumns
		    Case "initials asc"
		      
		      sql = sql + "initials ASC, due_date ASC, physics_tasking.patients.mrn ASC"
		      
		    Case "initials desc"
		      
		      sql = sql + "initials DESC, due_date DESC, physics_tasking.patients.mrn ASC"
		      
		    Case "physician_initials asc"
		      
		      sql = sql + "physician_initials ASC, physics_tasking.plans.due_date ASC, physics_tasking.patients.mrn ASC"
		      
		    Case "physician_initials desc"
		      
		      sql = sql + "physician_initials DESC, physics_tasking.plans.due_date DESC, physics_tasking.patients.mrn ASC"
		      
		    Case "due_date asc"
		      
		      sql = sql + "due_date ASC, physics_tasking.patients.mrn ASC"
		      
		    Case "due_date desc"
		      
		      sql = sql + "due_date DESC, physics_tasking.patients.mrn ASC"
		      
		    Case "mrn asc"
		      
		      sql = sql + "mrn ASC, due_date ASC"
		      
		    Case "mrn desc"
		      
		      sql = sql + "mrn DESC, due_date DESC"
		      
		    Case "full_name asc"
		      
		      sql = sql + "physics_tasking.patients.first_name ASC, physics_tasking.patients.family_name ASC, due_date ASC"
		      
		    Case "full_name desc"
		      
		      sql = sql + "physics_tasking.patients.first_name DESC, physics_tasking.patients.family_name DESC, due_date DESC"
		      
		    Case "site asc"
		      
		      sql = sql + "physics_tasking.sites.name ASC, due_date ASC, physics_tasking.patients.mrn ASC"
		      
		    Case "site desc"
		      
		      sql = sql + "physics_tasking.sites.name DESC, due_date DESC, physics_tasking.patients.mrn ASC"
		      
		    End Select
		    
		    Var rs As RowSet = Physics_Tasking.SELECT_Statement( sql)
		    
		    While Not rs.AfterLastRow
		      keys.Append( rs.Column("plan_id").IntegerValue)
		      
		      rs.MoveToNextRow
		    Wend
		    
		    rs.Close
		    
		    mSortedKeys = keys
		  End If
		  
		  Return mSortedKeys
		  
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function UnsortedPrimaryKeys() As Integer()
		  // Part of the WebDataSource interface.
		  
		  Var keys() As Integer 
		  
		  Var sql As String = "SELECT physics_tasking.plans.plan_id As plan_id " _
		  + "FROM physics_tasking.plans " _
		  + "INNER JOIN physics_tasking.patients USING (patient_id) " _
		  + "WHERE physics_tasking.plans.is_completed = 0 " _
		  + "ORDER BY DATE(physics_tasking.plans.due_date) ASC, physics_tasking.patients.mrn ASC;"
		  
		  Var rs As RowSet = Physics_Tasking.SELECT_Statement( sql)
		  
		  While Not rs.AfterLastRow
		    keys.Append( rs.Column("plan_id").IntegerValue)
		    
		    rs.MoveToNextRow
		  Wend
		  Return keys
		  
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mSortedKeys() As Integer
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
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
	#tag EndViewBehavior
End Class
#tag EndClass
