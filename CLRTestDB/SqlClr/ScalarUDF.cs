//------------------------------------------------------------------------------
// <copyright file="CSSqlFunction.cs" company="Microsoft">
//     Copyright (c) Microsoft Corporation.  All rights reserved.
// </copyright>
//------------------------------------------------------------------------------
using System;
using System.Data;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using Microsoft.SqlServer.Server;

// See http://www.codeproject.com/Articles/680161/Getting-Started-With-SQL-Server-2012-CLR-User-Defi
public partial class UserDefinedFunctions
{
    [SqlFunction]
    public static SqlString ScalarUDF()
    {
        return new SqlString("Hello World!");
    }
}