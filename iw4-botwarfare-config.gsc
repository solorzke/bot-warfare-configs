init()
{
    setdvar( "bots_loadout_rank", 0 );
    setdvar( "bots_loadout_prestige", -2 );
    level thread waitAndForceFill();
}

waitAndForceFill()
{
    level endon( "game_ended" );
    wait 5;
    botCount = 0;
    for ( i = 0; i < level.players.size; i++ )
    {
        if ( isDefined( level.players[i].pers[ "isBot" ] ) )
            botCount++;
    }
    if ( botCount == 0 )
    {
        fillAmount = getdvarint( "bots_manage_fill" );
        if ( fillAmount <= 1 )
            fillAmount = 16;
        setdvar( "bots_manage_add", fillAmount - 1 );
    }
}
