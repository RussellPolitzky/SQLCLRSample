using System.Collections;
using System.Data.SqlTypes;
using Microsoft.SqlServer.Server;

public partial class UserDefinedFunctions
{
    // See: http://www.codeproject.com/Articles/680161/Getting-Started-With-SQL-Server-2012-CLR-User-Defi
    private class TableType
    {
        public SqlInt32 Sequence { get; set; }
        public SqlString Text    { get; set; }
    }

    public static void TableUDF_FillRow(
        object tableTypeObject,
        out SqlInt32 sequence,
        out SqlString text)
    {
        TableType tableType = (TableType)tableTypeObject;
        sequence = tableType.Sequence;
        text     = tableType.Text;
    }

    [SqlFunction(
        DataAccess        = DataAccessKind.Read,
        TableDefinition   = "Sequence int, Text nvarchar(100)",
        FillRowMethodName = "TableUDF_FillRow")]
    public static IEnumerable TableUDF()
    {
        var tableResults = new ArrayList
        {
            new TableType {Sequence = 1, Text = "Hello"},
            new TableType {Sequence = 2, Text = "World"},
            new TableType {Sequence = 3, Text = "More" },
            new TableType {Sequence = 4, Text = "More" },
            new TableType {Sequence = 5, Text = "!"    }
        };

        // We'd use yield return to stream results.
        // This is efficient in the sense that we 
        // don't have to have everything in memory
        // before we start to return a result.
        foreach (var result in tableResults)
        {
            yield return result;
        }
    }
}