using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace RacketReel.Infrastructure.Migrations
{
    /// <inheritdoc />
    public partial class AddedFollowerEntity : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "Follower",
                schema: "RacketReel",
                columns: table => new
                {
                    UserId = table.Column<string>(type: "text", nullable: false),
                    FollowerUserId = table.Column<string>(type: "text", nullable: false),
                    FollowedAtUtc = table.Column<DateTimeOffset>(type: "timestamp with time zone", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Follower", x => new { x.UserId, x.FollowerUserId });
                });
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Follower",
                schema: "RacketReel");
        }
    }
}
