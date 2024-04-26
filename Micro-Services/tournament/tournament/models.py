from pydantic import BaseModel, validator, Field

class TournamentData(BaseModel):
    tournamentOwner: str = Field(..., example="John Doe")
    player1: str = Field(..., nullable=False)
    player2: str = Field(..., nullable=False)
    player3: str = Field(..., nullable=False)
    player4: str = Field(..., nullable=False)
    game1_winner: str = Field(..., nullable=False)
    game1_loser: str = Field(..., nullable=False)
    game1_player1_score: int = Field(..., nullable=False)
    game1_player2_score: int = Field(..., nullable=False)
    game2_winner: str = Field(..., nullable=False)
    game2_loser: str = Field(..., nullable=False)
    game2_player1_score: int = Field(..., nullable=False)
    game2_player2_score: int = Field(..., nullable=False)
    game3_winner: str = Field(..., nullable=False)
    game3_loser: str = Field(..., nullable=False)
    game3_player1_score: int = Field(..., nullable=False)
    game3_player2_score: int = Field(..., nullable=False)
    Lang: str = Field(...)
    
    def save(self, *args, **kwargs):
        self.full_clean()
        super().save(*args, **kwargs)

    @validator('Lang')
    def lang_must_be_valid(cls, v):
        if v not in ['es', 'fr', 'en']:
            raise ValueError('Language must be "es", "fr", or "en"')
        return v
    
    @validator(
    "game1_player1_score", "game1_player2_score",
    "game2_player1_score", "game2_player2_score",
    "game3_player1_score", "game3_player2_score"
    )
    def validate_scores(cls, value):
        if not 0 <= value <= 5:
            raise ValueError("Les scores doivent être compris entre 0 et 5.")
        return value