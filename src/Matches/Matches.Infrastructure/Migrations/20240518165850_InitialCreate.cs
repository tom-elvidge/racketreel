using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Matches.Infrastructure.Migrations
{
    public partial class InitialCreate : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.EnsureSchema(
                name: "Matches");

            migrationBuilder.CreateSequence(
                name: "Matcheseq",
                schema: "Matches",
                incrementBy: 10);

            migrationBuilder.CreateSequence(
                name: "Matchseq",
                schema: "Matches",
                incrementBy: 10);

            migrationBuilder.CreateSequence(
                name: "Stateseq",
                schema: "Matches",
                incrementBy: 10);

            migrationBuilder.CreateTable(
                name: "Matches",
                schema: "Matches",
                columns: table => new
                {
                    Id = table.Column<int>(type: "integer", nullable: false),
                    UserId = table.Column<string>(type: "text", nullable: true),
                    CreatedAtDateTime = table.Column<DateTime>(type: "timestamp with time zone", nullable: false),
                    CompletedAtDateTime = table.Column<DateTime>(type: "timestamp with time zone", nullable: false),
                    ParticipantOne_Name = table.Column<string>(type: "text", nullable: true),
                    ParticipantTwo_Name = table.Column<string>(type: "text", nullable: true),
                    ServingFirst = table.Column<int>(type: "integer", nullable: false),
                    Sets = table.Column<int>(type: "integer", nullable: true),
                    SuddenDeathDeuce = table.Column<bool>(type: "boolean", nullable: true),
                    Games = table.Column<int>(type: "integer", nullable: true),
                    _gamesFinalSet = table.Column<int>(type: "integer", nullable: true),
                    GameAdvantage = table.Column<bool>(type: "boolean", nullable: true),
                    _gameAdvantageFinalSet = table.Column<bool>(type: "boolean", nullable: true),
                    TiebreakRule = table.Column<int>(type: "integer", nullable: true),
                    _tiebreakRuleFinalSet = table.Column<int>(type: "integer", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Matches", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "States",
                schema: "Matches",
                columns: table => new
                {
                    Id = table.Column<int>(type: "integer", nullable: false),
                    Version = table.Column<int>(type: "integer", nullable: false),
                    CreatedAtDateTime = table.Column<DateTime>(type: "timestamp with time zone", nullable: false),
                    Serving = table.Column<int>(type: "integer", nullable: false),
                    Score_P1Points = table.Column<int>(type: "integer", nullable: true),
                    Score_P2Points = table.Column<int>(type: "integer", nullable: true),
                    Score_P1Games = table.Column<int>(type: "integer", nullable: true),
                    Score_P2Games = table.Column<int>(type: "integer", nullable: true),
                    Score_P1Sets = table.Column<int>(type: "integer", nullable: true),
                    Score_P2Sets = table.Column<int>(type: "integer", nullable: true),
                    Highlight = table.Column<bool>(type: "boolean", nullable: false),
                    MatchEntityId = table.Column<int>(type: "integer", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_States", x => x.Id);
                    table.ForeignKey(
                        name: "FK_States_Matches_MatchEntityId",
                        column: x => x.MatchEntityId,
                        principalSchema: "Matches",
                        principalTable: "Matches",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_States_MatchEntityId",
                schema: "Matches",
                table: "States",
                column: "MatchEntityId");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "States",
                schema: "Matches");

            migrationBuilder.DropTable(
                name: "Matches",
                schema: "Matches");

            migrationBuilder.DropSequence(
                name: "Matcheseq",
                schema: "Matches");

            migrationBuilder.DropSequence(
                name: "Matchseq",
                schema: "Matches");

            migrationBuilder.DropSequence(
                name: "Stateseq",
                schema: "Matches");
        }
    }
}
