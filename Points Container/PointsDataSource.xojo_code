#tag Class
Protected Class PointsDataSource
Implements WebDataSource
	#tag Method, Flags = &h21
		Private Sub Calculate_parameters()
		  Var sql As String = "SELECT COUNT(user_id) as count, AVG(total) as average, STDDEV_SAMP(total) as std " _
		  + "FROM physics_tasking.points " _
		  + "WHERE is_active = TRUE;"
		  
		  Var rs As RowSet = Physics_Tasking.DB_SELECT_Statement( sql)
		  
		  avg = rs.Column("average").DoubleValue
		  std = rs.Column("std").DoubleValue
		  
		  If rs = Nil Then 
		    avg = 0
		    std = 0
		    Return
		    
		  End If
		  
		  
		  Var p11 As Double = Numerical_Recipies.Cummulative_Normal_Distribution(2.0)
		  Var p1 As Double = Numerical_Recipies.Cummulative_Normal_Distribution(1.0)
		  
		  Var p2 As Double = Numerical_Recipies.Cummulative_Normal_Distribution(0)
		  Var p3 As Double = Numerical_Recipies.Cummulative_Normal_Distribution(-1.0)
		  Var p4 As Double = Numerical_Recipies.Cummulative_Normal_Distribution(-2.0)
		  
		  normalization = 0
		  
		  
		  sql = "SELECT user_id, total " _
		  + "FROM physics_tasking.points " _
		  + "WHERE is_active = TRUE;"
		  
		  Var rs_planners As RowSet = Physics_Tasking.DB_SELECT_Statement( sql)
		  Var id_probability As Double = 0
		  
		  While Not rs_planners.AfterLastRow
		    
		    Var z As Double = (rs_planners.Column("total").DoubleValue - avg) / std
		    Var p As Double = 1 - Numerical_Recipies.Cummulative_Normal_Distribution(z)
		    normalization = normalization + p
		    
		    
		    rs_planners.MoveToNextRow
		    
		  Wend
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function Calculate_probability(id as integer) As double
		  Var sql As String = "SELECT total " _
		  + "FROM physics_tasking.points " _
		  + "WHERE is_active = TRUE " _
		  + "AND user_id = " + id.ToString + ";"
		  
		  Var rs As RowSet = Physics_Tasking.DB_SELECT_Statement( sql)
		  
		  Var z As Double = (rs.Column("total").DoubleValue - avg) / std
		  Var p As Double = 1 - Numerical_Recipies.Cummulative_Normal_Distribution(z)
		  
		  
		  Return p / normalization
		  
		  
		  
		  
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function ColumnData() As WebListboxColumnData()
		  // Part of the WebDataSource interface.
		  
		  // This method is called once when the control is first created
		  // Returns information about the columns themselves
		  
		  Var cols() As WebListboxColumnData
		  
		  Var col As WebListboxColumnData
		  
		  col = New WebListboxColumnData
		  col.DatabaseColumnName = "initials" // the name of the field in your database or data source
		  col.Heading = "Initials" // the name that appears above the column
		  col.Sortable = False // Whether or not the column is sortable
		  'col.SortDirection = Weblistbox.SortDirections.Ascending // The default sort direction for the column
		  col.Width = "75"
		  cols.Add(col)
		  
		  col = New WebListboxColumnData
		  col.DatabaseColumnName = "plan_points" // the name of the field in your database or data source
		  col.Heading = "Plan points" // the name that appears above the column
		  col.Sortable = False // Whether or not the column is sortable
		  'col.SortDirection = Weblistbox.SortDirections.Ascending // The default sort direction for the column
		  col.Width = "100"
		  cols.Add(col)
		  
		  col = New WebListboxColumnData
		  col.DatabaseColumnName = "task_points" // the name of the field in your database or data source
		  col.Heading = "Task points" // the name that appears above the column
		  col.Sortable = False // Whether or not the column is sortable
		  'col.SortDirection = Weblistbox.SortDirections.Ascending // The default sort direction for the column
		  col.Width = "100"
		  cols.Add(col)
		  
		  col = New WebListboxColumnData
		  col.DatabaseColumnName = "total_points" // the name of the field in your database or data source
		  col.Heading = "Total" // the name that appears above the column
		  col.Sortable = False // Whether or not the column is sortable
		  'col.SortDirection = Weblistbox.SortDirections.Ascending // The default sort direction for the column
		  col.Width = "75"
		  cols.Add(col)
		  
		  col = New WebListboxColumnData
		  col.DatabaseColumnName = "probability" // the name of the field in your database or data source
		  col.Heading = "Prob." // the name that appears above the column
		  col.Sortable = False // Whether or not the column is sortable
		  'col.SortDirection = Weblistbox.SortDirections.Ascending // The default sort direction for the column
		  col.Width = "75"
		  cols.Add(col)
		  
		  
		  Return cols// Part of the WebDataSource interface.
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function RowCount() As Integer
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function RowData(RowCount as Integer, RowOffset as Integer, SortColumns as String) As WebListboxRowData()
		  // Part of the WebDataSource interface.
		  
		  Calculate_parameters
		  
		  Var rows() As WebListboxRowData
		  Var sql As String = "SELECT physics_tasking.points.user_id As user_id, " _
		  + "physics_tasking.points.tasks_total As tasks_total, " _
		  + "physics_tasking.points.plans_total As plans_total, " _
		  + "physics_tasking.points.total As total, " _
		  + "physics_tasking.users.initials As initials, " _
		  + "physics_tasking.users.is_active As is_active " _
		  + "FROM physics_tasking.points " _
		  + "INNER JOIN physics_tasking.users USING (user_id) " _
		  + "ORDER BY total DESC"
		  
		  Var rs As RowSet = Physics_Tasking.DB_SELECT_Statement( sql)
		  
		  
		  
		  While Not rs.AfterLastRow
		    
		    Var s As New WebStyle
		    
		    s.FontSize = 15
		    
		    Select Case rs.Column("is_active").BooleanValue
		    Case False
		      
		      s.BackgroundColor = App.Colour_Warn //Color.Red
		      
		      
		    Case False
		      
		      
		    End Select
		    
		    
		    Var row As New WebListBoxRowData
		    row.PrimaryKey = rs.Column("user_id").IntegerValue
		    
		    row.Tag = rs.Column("is_active").BooleanValue
		    
		    
		    Var cellRenderer As New WebListBoxStyleRenderer(s, rs.Column("initials").StringValue.Trim.Uppercase)
		    row.Value("initials") = cellRenderer
		    
		    cellRenderer = New WebListBoxStyleRenderer(s, _
		    Format(rs.Column("tasks_total").DoubleValue, "0.0"))
		    row.Value("task_points") = cellRenderer
		    
		    cellRenderer = New WebListBoxStyleRenderer(s, _
		    Format(rs.Column("plans_total").DoubleValue, "0.0"))
		    row.Value("plan_points") = cellRenderer
		    
		    cellRenderer = New WebListBoxStyleRenderer(s, _
		    Format(rs.Column("total").DoubleValue, "0.0"))
		    row.Value("total_points") = cellRenderer
		    
		    If rs.Column("is_active").BooleanValue Then
		      cellRenderer = New WebListBoxStyleRenderer(s, _
		      Format(Calculate_probability(rs.Column("user_id").IntegerValue), "%0.0"))
		    Else
		      
		      cellRenderer = New WebListBoxStyleRenderer(s, _
		      "---")
		      
		    End If
		    
		    row.Value("probability") = cellRenderer
		    
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
		  
		  Var keys() As Integer 
		  
		  Var sql As String = "SELECT physics_tasking.points.user_id As user_id " _
		  + "FROM physics_tasking.points " _
		  + "INNER JOIN physics_tasking.users USING (user_id) " _
		  + "ORDER BY total DESC"
		  
		  Var rs As RowSet = Physics_Tasking.DB_SELECT_Statement( sql)
		  
		  While Not rs.AfterLastRow
		    keys.Append( rs.Column("user_id").IntegerValue)
		    
		    rs.MoveToNextRow
		  Wend
		  Return keys// Part of the WebDataSource interface.
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function UnsortedPrimaryKeys() As Integer()
		  // Part of the WebDataSource interface.
		  
		  Var keys() As Integer 
		  
		  Var sql As String = "SELECT physics_tasking.points.user_id As user_id " _
		  + "FROM physics_tasking.points " _
		  + "INNER JOIN physics_tasking.users USING (user_id) " _
		  + "ORDER BY total DESC"
		  
		  Var rs As RowSet = Physics_Tasking.DB_SELECT_Statement( sql)
		  
		  While Not rs.AfterLastRow
		    keys.Append( rs.Column("user_id").IntegerValue)
		    
		    rs.MoveToNextRow
		  Wend
		  Return keys
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private avg As double
	#tag EndProperty

	#tag Property, Flags = &h21
		Private normalization As double
	#tag EndProperty

	#tag Property, Flags = &h21
		Private std As double
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
