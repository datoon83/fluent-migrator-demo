using System;
using FluentMigrator;

namespace FluentMigratorDemo.Migrations
{
    [Migration(1)]
    public class InitialMigration : Migration
    {
        public override void Up()
        {
            Create.Table("tbl_Users")
                .WithColumn("Id")
                .AsInt32()
                .PrimaryKey()
                .WithColumn("FirstName")
                .AsString(255)
                .WithColumn("Surname");

            Execute.EmbeddedScript("CreateTable.sql");
        }

        public override void Down()
        {
            throw new NotImplementedException();
        }
    }
}
