#include <cef>


forward CefDialogs(player_id);
forward OnCefDialogResponse(player_id, const arg[]);

public OnGameModeInit()
{
  cef_subscribe("data:buttons", "OnCefDialogResponse");

  cef_subscribe("dialog:on", "CefDialogs");
}


public CefDialogs(player_id) {

//главные кнопки
cef_emit_event(player_id, "data:dialogs:buttons",
    CEFSTR(dialog[player_id][dialog_button1]), CEFSTR(dialog[player_id][dialog_button2]),CEFSTR(dialog[player_id][dialog_button3]), 
    CEFSTR(dialog[player_id][dialog_button4]), CEFSTR(dialog[player_id][dialog_button5]), CEFSTR(dialog[player_id][dialog_button6]),
    CEFSTR(dialog[player_id][dialog_button7]), CEFSTR(dialog[player_id][dialog_button8]),CEFSTR(dialog[player_id][dialog_button9]), 
    CEFSTR(dialog[player_id][dialog_button10]), CEFSTR(dialog[player_id][dialog_button11]), CEFSTR(dialog[player_id][dialog_button12]),
    CEFSTR(dialog[player_id][dialog_button13]), CEFSTR(dialog[player_id][dialog_button14]),CEFSTR(dialog[player_id][dialog_button15]));

//название и две нижних кнопки
    cef_emit_event(player_id, "data:dialogs:parameters", CEFSTR(dialog[player_id][dialog_name]), CEFSTR(dialog[player_id][dialog_e1btn]), 
    CEFSTR(dialog[player_id][dialog_e2btn]));

//такие нужные параметры тоже
    cef_emit_event(player_id, "data:dialogs:id", CEFINT(dialog[player_id][dialogid]), CEFINT(dialog[player_id][browser]), CEFINT(dialog[player_id] 
    [btnmax]));


}

stock ClearDialog(player_id, const b, const d)
{
 dialog[player_id][btnmax] = -1;
dialog[player_id][browser] = -1;
strins(dialog[player_id][dialog_name], "",0);
strins(dialog[player_id][dialog_button1], "", 0);
strins(dialog[player_id][dialog_button2], "", 0);
strins(dialog[player_id][dialog_button3], "", 0);
strins(dialog[player_id][dialog_button4], "", 0);
strins(dialog[player_id][dialog_button5], "", 0);
strins(dialog[player_id][dialog_button6], "", 0);
strins(dialog[player_id][dialog_button7], "", 0);
strins(dialog[player_id][dialog_button8], "", 0);
strins(dialog[player_id][dialog_button9], "", 0);
strins(dialog[player_id][dialog_button10], "", 0);
strins(dialog[player_id][dialog_button11], "", 0);
strins(dialog[player_id][dialog_button12], "", 0);
strins(dialog[player_id][dialog_button13], "", 0);
strins(dialog[player_id][dialog_button14], "", 0);
strins(dialog[player_id][dialog_button15], "", 0);
strins(dialog[player_id][dialog_e1btn], "", 0);
strins(dialog[player_id][dialog_e2btn], "", 0);

dialog[player_id][dialog_id] = -1;   

cef_emit_event(player_id, "data:dialogs:buttons",
    CEFSTR(dialog[player_id][dialog_button1]), CEFSTR(dialog[player_id][dialog_button2]),CEFSTR(dialog[player_id][dialog_button3]), 
    CEFSTR(dialog[player_id][dialog_button4]), CEFSTR(dialog[player_id][dialog_button5]), CEFSTR(dialog[player_id][dialog_button6]),
    CEFSTR(dialog[player_id][dialog_button7]), CEFSTR(dialog[player_id][dialog_button8]),CEFSTR(dialog[player_id][dialog_button9]), 
    CEFSTR(dialog[player_id][dialog_button10]), CEFSTR(dialog[player_id][dialog_button11]), CEFSTR(dialog[player_id][dialog_button12]),
    CEFSTR(dialog[player_id][dialog_button13]), CEFSTR(dialog[player_id][dialog_button14]),CEFSTR(dialog[player_id][dialog_button15]));

//название и две нижних кнопки
    cef_emit_event(player_id, "data:dialogs:parameters", CEFSTR(dialog[player_id][dialog_name]), CEFSTR(dialog[player_id][dialog_e1btn]), 
    CEFSTR(dialog[player_id][dialog_e2btn]));

//такие нужные параметры тоже
    cef_emit_event(player_id, "data:dialogs:id", CEFINT(dialog[player_id][dialogid]), CEFINT(dialog[player_id][browser]), CEFINT(dialog[player_id] 
    [btnmax]));
    
}
public OnCefDialogResponse(player_id, const arg[]) {
extract arg -> new id_dialog, btnid, browser_id;
switch(id_dialog)
{
    case 1:
    {
        switch(btnid)
        {
            //ну тут функции к кнопочкам их ( 26 )
            case 1:
            {
                SendClientMessage(player_id, -1, "Вы нажали на кнопку 1");
            }

            //2 нижнее кнопки
            case 998:
            {
                //это будет выступать мне закрытием
                cef_focus_browser(player_id, browser_id, false);
                cef_destroy_browser(player_id, browser_id);
            }
            case 999:
            {

            }
        }
    }
}
}


cmd:showdialog(player_id) { AddDialog(player_id, 1, 1, "C:/Users/Kirill/Desktop/dialogs-cef/index.html", 15, "Тестовый заголовок", "1", "2", "3","4", "5", "6", "7", "8", "9", "10", "11", "12", "13","14", "15", "Выход", "None"); //где None если вы не юзаете кнопку советую так и оставлять None ( будет баг со стилем ) 
return true; }
