this addAction  
[  
    "Heal, Repair, Refuel and Rearm",
    {  
        [[_this select 0, _this select 1], "scripts\Rearm\general\HealandRepair.sqf"] remoteExec ["BIS_fnc_execVM",0,false] ;  
    },  
    nil,         
    1.5,        
    true,        
    false,       
    "",          
    "true",     
    5,          
    false,      
    "",         
    ""          
];