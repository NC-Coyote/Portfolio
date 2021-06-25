using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class inGameUI : MonoBehaviour
{
    // public variables
    public GameObject skillMenuUI;
    public bool skillMenuActive;

    void Update()
    {
        // if I is pressed, then open up the skills menu
        /*if(Input.GetKeyDown(KeyCode.I))
        {
            if(skillMenuActive == false)
            {
                skillMenu();
            }
            else
            {
                skillMenuActive = false;
                skillMenuUI.SetActive(false);
            }
        }
        */
    }

    public void openSkillMenu()
    {
        if (skillMenuActive == false)
        {
            skillMenu();
        }
        else
        {
            skillMenuActive = false;
            skillMenuUI.SetActive(false);
            Time.timeScale = 1f;
        }
    }


    // the actual code to open the skill menu
    public void skillMenu()
    {
        // this boolean will be used to prevent the player from shooting during clicks when the skill menu is open
        skillMenuActive = true;
        skillMenuUI.SetActive(true);
        Time.timeScale = 0f;
    }
}
