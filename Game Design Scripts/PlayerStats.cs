using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.UI;
using TMPro;

public class PlayerStats : MonoBehaviour
{
    // public variables
    public float playerHealth;
    public float playerMaxHealth;
    public int playerExp = 0;
    public float playerMoney = 0;
    public int expThreshold;
    public int skillPoints = 0;
    public int gameLevel;
    public TMP_Text skillCounter;
    public TMP_Text shopSkillCounter;
    public float playerDmg;

    public GameObject notAfford;
    public healthBar healthBar;
    public healthBar shopHealthBar;
    public expBar expBar;
    public int ripAndTear = 0;
    public GameObject dmgButton;
    public GameObject dmgUpPurchased;

    public int toYourCredit = 0;
    public GameObject moneyButton;
    public GameObject moneyFindPurchased;

    public int suitUp = 0;
    public GameObject armorButton;
    public GameObject armorUpPurchased;

    public int regen = 0;
    public GameObject regenButton;
    public GameObject regenPurchased;

    public GameObject loseScreen;
    public bool loseMenuScreen;

    public GameObject keycardImage;
    public bool keycard = false;

    public TMP_Text moneyBalance;
    public GameObject notEnoughMoney;

    public bool shopDmg;
    public GameObject shopDmgBtn;
    public GameObject shopDmgPurchased;

    public bool shopXp;
    public GameObject shopXPBtn;
    public GameObject shopXPPurchased;

    private GameObject shop;
    public GameObject lvl3Hint;

    private winCondition winCond;

    void Start()
    {
        // start the coroutine for the regneration skill (the coroutine itself will check if the player has bought the skill)
        StartCoroutine(regenActive());

        // set values to certain variables
        keycardImage.SetActive(false);
        gameLevel = SceneManager.GetActiveScene().buildIndex - 1;
        loseMenuScreen = false;
        playerHealth = playerMaxHealth;
        healthBar.SetMaxHealth(playerMaxHealth);
        shopHealthBar.SetMaxHealth(playerMaxHealth);
        expBar.SetMaxExp(expThreshold);
        shop = GameObject.FindGameObjectWithTag("shop");
        winCond = GameObject.FindGameObjectWithTag("winning").GetComponent<winCondition>();
        if(gameLevel == 3)
        {
            lvl3Hint.SetActive(true);
        }
        else
        {
            lvl3Hint.SetActive(false);
        }

        // load player stats from previous gameplay
        if (gameLevel > 1)
        {
            LoadStats();
        }
    }

    void Update()
    {
        // pause the game if the shop is open
        if(shop.activeSelf)
        {
            Time.timeScale = 0f;
        }

        // setup player health, setup the health bar, experience bar, money, and the skill point counter
        if(playerHealth > playerMaxHealth)
        {
            playerHealth = playerMaxHealth;
        }
        healthBar.SetHealth(playerHealth);
        shopHealthBar.SetHealth(playerHealth);
        expBar.SetExp(playerExp);
        skillCounter.text = skillPoints.ToString();
        shopSkillCounter.text = skillPoints.ToString();
        moneyBalance.text = playerMoney.ToString();

        // run the skillUp function to see if the player has gained experience and/or skill points
        skillUp();

        // temporary/test features to damage, heal, give experience, give money
        if(Input.GetKeyDown(KeyCode.T))
        {
            takeDamage(20);
        }

        if(Input.GetKeyDown(KeyCode.H))
        {
            takeDamage(-20);
        }

        if(Input.GetKeyDown(KeyCode.E))
        {
            giveExperience(10);
        }

        if(Input.GetKeyDown(KeyCode.X))
        {
            PlayerPrefs.DeleteAll();
        }

        if(Input.GetKeyDown(KeyCode.M))
        {
            giveMoney(100);
        }
    }

    // function to give the player experience points
    public void giveExperience(int expAmount)
    {
        playerExp += expAmount;
        PlayerPrefs.SetInt("playerExp", playerExp);
    }

    // function to give the player money
    public void giveMoney(float moneyAmount)
    {
        playerMoney += moneyAmount;
        PlayerPrefs.SetFloat("playerMoney", playerMoney);
    }

    // function allowing the player to take damage and have the health bar reflect it
    public void takeDamage(float dmgAmount)
    {
        if(suitUp == 1)
        {
            playerHealth -= (dmgAmount * 0.7f);
            PlayerPrefs.SetFloat("playerHealth", playerHealth);
        }
        else
        {
            playerHealth -= dmgAmount;
            PlayerPrefs.SetFloat("playerHealth", playerHealth);
        }

        healthBar.SetHealth(playerHealth);

        if(playerHealth <= 0)
        {
            loseMenuScreen = true;
            Time.timeScale = 0;
            loseScreen.SetActive(true);
            playerHealth = playerMaxHealth;
            PlayerPrefs.SetFloat("playerHealth", playerHealth);
            playerExp = 0;
            PlayerPrefs.SetInt("playerExp", playerExp);
        }
    }

    // check to see if the player has gained enough experience points and if so, reset the experience and grant a skill point
    public void skillUp()
    {
        if(playerExp >= expThreshold)
        {
            skillPoints++;
            playerExp -= expThreshold;
            PlayerPrefs.SetInt("skillPoints", skillPoints);
            PlayerPrefs.SetInt("playerExp", playerExp);
        }
    }

    // the skill to increase damage by 50%
    public void damageUp()
    {
        if(ripAndTear == 0 && skillPoints >= 2)
        {
            skillPoints -= 2;
            PlayerPrefs.SetInt("skillPoints", skillPoints);
            ripAndTear = 1;
            PlayerPrefs.SetInt("ripAndTear", ripAndTear);
            dmgUpPurchased.SetActive(true);
            dmgButton.GetComponent<Button>().enabled = false;
        }
        else
        {
            StartCoroutine(NotEnoughSP());
        }
    }

    // the skill to increase the amount of money per enemy kill
    public void moneyFind()
    {
        if(toYourCredit == 0 && skillPoints >= 4)
        {
            skillPoints -= 4;
            PlayerPrefs.SetInt("skillPoints", skillPoints);
            toYourCredit = 1;
            PlayerPrefs.SetInt("toYourCredit", toYourCredit);
            moneyFindPurchased.SetActive(true);
            moneyButton.GetComponent<Button>().enabled = false;
        }
        else
        {
            StartCoroutine(NotEnoughSP());
        }
    }

    // the skill to increase armor/reduce damage taken from enemies
    public void armorUp()
    {
        if(suitUp == 0 && skillPoints >= 2)
        {
            skillPoints -= 2;
            PlayerPrefs.SetInt("skillPoints", skillPoints);
            suitUp = 1;
            PlayerPrefs.SetInt("suitUp", suitUp);
            armorUpPurchased.SetActive(true);
            armorButton.GetComponent<Button>().enabled = false;
        }
        else
        {
            StartCoroutine(NotEnoughSP());
        }
    }

    // the code to initiate the regneration skill (not actually call it)
    public void regenerate()
    {
        if(regen == 0 && skillPoints >= 4)
        {
            skillPoints -= 4;
            PlayerPrefs.SetInt("skillPoints", skillPoints);
            regen = 1;
            PlayerPrefs.SetInt("regen", regen);
            regenPurchased.SetActive(true);
            regenButton.GetComponent<Button>().enabled = false;
        }
        else
        {
            StartCoroutine(NotEnoughSP());
        }
    }

    // this code flashes the warning that the player doesn't have enough skill points if they try to buy a skill worth more skill points than they have
    public IEnumerator NotEnoughSP()
    {
        for (int i = 0; i < 3; i++)
        {
            notAfford.SetActive(true);
            yield return new WaitForSecondsRealtime(0.25f);
            notAfford.SetActive(false);
            yield return new WaitForSecondsRealtime(0.25f);
        }

        StopCoroutine(NotEnoughSP());
    }

    public IEnumerator NotEnoughMoney()
    {
        for (int i = 0; i < 3; i++)
        {
            notEnoughMoney.SetActive(true);
            yield return new WaitForSecondsRealtime(0.25f);
            notEnoughMoney.SetActive(false);
            yield return new WaitForSecondsRealtime(0.25f);
        }

        StopCoroutine(NotEnoughMoney());
    }

    // the code to actually call the regeneration skill
    public IEnumerator regenActive()
    {
        while(true)
        {
            if(regen == 1)
            {
                yield return new WaitForSeconds(1f);
                playerHealth += 1.5f;
            }
            else
            {
                yield return null;
            }
        }
    }

    public void LoadStats()
    { 
        playerHealth = PlayerPrefs.GetFloat("playerHealth");
        playerExp = PlayerPrefs.GetInt("playerExp");
        playerMoney = PlayerPrefs.GetFloat("playerMoney");
        skillPoints = PlayerPrefs.GetInt("skillPoints");
        
        ripAndTear = PlayerPrefs.GetInt("ripAndTear");
        if(ripAndTear == 1)
        {
            dmgUpPurchased.SetActive(true);
            dmgButton.GetComponent<Button>().enabled = false;
        }
        toYourCredit = PlayerPrefs.GetInt("toYourCredit");
        if(toYourCredit == 1)
        {
            moneyFindPurchased.SetActive(true);
            moneyButton.GetComponent<Button>().enabled = false;
        }
        suitUp = PlayerPrefs.GetInt("suitUp");
        if(suitUp == 1)
        {
            armorUpPurchased.SetActive(true);
            armorButton.GetComponent<Button>().enabled = false;
        }
        regen = PlayerPrefs.GetInt("regen");
        if(regen == 1)
        {
            regenPurchased.SetActive(true);
            regenButton.GetComponent<Button>().enabled = false;
        }
    }

    public void Unpause()
    {
        Time.timeScale = 1f;
    }

    public void heal()
    {
        if(playerMoney >= 50)
        {
            playerMoney -= 50;
            PlayerPrefs.SetFloat("playerMoney", playerMoney);
            playerHealth += (playerMaxHealth * 0.25f);
            shopHealthBar.SetHealth(playerHealth);
        }
        else
        {
            StartCoroutine(NotEnoughMoney());
        }
    }

    public void buyDmg()
    {
        if(playerMoney >= 150)
        {
            playerMoney -= 150;
            PlayerPrefs.SetFloat("playerMoney", playerMoney);
            shopDmg = true;
            shopDmgBtn.GetComponent<Button>().enabled = false;
            shopDmgPurchased.SetActive(true);
        }
        else
        {
            StartCoroutine(NotEnoughMoney());
        }
    }

    public void buyXP()
    {
        if(playerMoney >= 250)
        {
            playerMoney -= 250;
            PlayerPrefs.SetFloat("playerMoney", playerMoney);
            shopXp = true;
            shopXPBtn.GetComponent<Button>().enabled = false;
            shopXPPurchased.SetActive(true);
        }
        else
        {
            StartCoroutine(NotEnoughMoney());
        }
    }

    public void buySP()
    {
        if(playerMoney >= 500)
        {
            playerMoney -= 500;
            PlayerPrefs.SetFloat("playerMoney", playerMoney);
            skillPoints++;
        }
        else
        {
            StartCoroutine(NotEnoughMoney());
        }
    }
}
