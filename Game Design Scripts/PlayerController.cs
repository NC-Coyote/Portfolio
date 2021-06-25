using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class PlayerController : MonoBehaviour
{
    // public variables
    public float moveSpeed = 3f;
    public float jumpForce = 5f;
    public float followSpeed = 1f;

    public Animator animator;
    public Transform player;
    public Transform aimPoint;
    public GameObject projectile;
    public float startBtwAttacks;
    public GameObject fireEffect;
    public AudioSource audioSource;
    public AudioSource footstepSource;
    public AudioClip shootSound;
    public AudioClip footstepSound;
    public AudioClip jumpSound;
    public winCondition winCond;

    // private variables
    private Transform camPos;
    private PlayerStats playerStats;

    [SerializeField] private LayerMask groundLayerMask;

    public inGameUI skillMenuCheck;

    private Rigidbody2D rigidBody;
    private BoxCollider2D boxCollider;
    private bool faceRight;
    private float timeBtwAttacks;

    public bool moveLeft;
    public bool moveRight;
    public float horizontalMove;
    public bool Jumpy;
    public bool shooting;

    void Start()
    {
        // assign various values to certain variables
        playerStats = GetComponent<PlayerStats>();
        groundLayerMask = LayerMask.GetMask("Ground");
        camPos = Camera.main.transform;
        rigidBody = transform.GetComponent<Rigidbody2D>();
        boxCollider = transform.GetComponent<BoxCollider2D>();
        moveLeft = false;
        moveRight = false;
        Jumpy = false;
        shooting = false;
    }

    void Update()
    {
        // call various functions to allow for the camera to follow the player, movement, attacking, etc...
        CameraFollow();
        MovementPlayer();
        Jump();
         if (winCond.victory == false && playerStats.loseMenuScreen == false)
         {
            Attack();
         }
    }



    // make the camera follow the player
    void CameraFollow()
    {
        Vector3 targetPos = new Vector3(player.position.x, player.position.y, camPos.position.z);
        camPos.position = targetPos;
    }


    public void PointerDownLeft()
    {
        moveLeft = true;
    }

    public void PointerUpLeft()
    {
        moveLeft = false;
    }


    public void PointerDownRight()
    {
        moveRight = true;
    }

    public void PointerUpRight()
    {
        moveRight = false;
    }


    void MovementPlayer()
    {
        if ((moveLeft || Input.GetKey(KeyCode.A)) && skillMenuCheck.skillMenuActive == false)
        {

            if (faceRight == false)
            {
                transform.Rotate(0f, 180f, 0f);
                faceRight = !faceRight;
            }
            horizontalMove = -moveSpeed;

            animator.SetBool("run", true);
            
            if (!footstepSource.isPlaying && isGrounded() == true)
            {
                footstepSource.Play();
            }
            else if (isGrounded() == false)
            {
                footstepSource.Stop();
            }

        }

        else if ((moveRight || Input.GetKey(KeyCode.D)) && skillMenuCheck.skillMenuActive == false)
        {
            if (faceRight == true)
            {
                transform.Rotate(0f, 180f, 0f);
                faceRight = !faceRight;
            }
            horizontalMove = moveSpeed;

            animator.SetBool("run", true);

            if (!footstepSource.isPlaying && isGrounded() == true)
            {
                footstepSource.Play();
            }
            else if (isGrounded() == false)
            {
                footstepSource.Stop();
            }
        }

        else
        {
            footstepSource.Stop();
            horizontalMove = 0;
            animator.SetBool("run", false);
        }
    }

    private void FixedUpdate()
    {
        rigidBody.velocity = new Vector2(horizontalMove, rigidBody.velocity.y);

    }

    // check if player is facing right or left and move them in the specified direction as well as shifting the aimPoint
    /*public void Movement()
     {
         // move left
         if (Input.GetKey(KeyCode.A))
         {
             if (faceRight == false)
             {
                 transform.Rotate(0f, 180f, 0f);
                 faceRight = !faceRight;
             }

             rigidBody.velocity = new Vector2(-moveSpeed, rigidBody.velocity.y);

             if (!footstepSource.isPlaying && isGrounded() == true)
             {
                 footstepSource.Play();
             }
             else if(isGrounded() == false)
             {
                 footstepSource.Stop();
             }
             animator.SetBool("run", true);
         }
         else
         {
             // move right
             if (Input.GetKey(KeyCode.D))
             {
                 if (faceRight == true)
                 {
                     transform.Rotate(0f, 180f, 0f);
                     faceRight = !faceRight;
                 }

                 rigidBody.velocity = new Vector2(moveSpeed, rigidBody.velocity.y);

                 if(!footstepSource.isPlaying && isGrounded() == true)
                 {
                     footstepSource.Play();
                 }
                 else if (isGrounded() == false)
                 {
                     footstepSource.Stop();
                 }
                 animator.SetBool("run", true);
             }
             else
             {
                 rigidBody.velocity = new Vector2(0, rigidBody.velocity.y);
                 footstepSource.Stop();
                 animator.SetBool("run", false);
             }
         }
     }
    */

    public void PointerDownJump()
    {
        Jumpy = true;
    }

    public void PointerUpJump()
    {
        Jumpy = false;

    }

    // the jump function
    public void Jump()
    {

        if ((Jumpy || Input.GetKeyDown(KeyCode.Space)) && isGrounded() && skillMenuCheck.skillMenuActive == false)
        {
            audioSource.PlayOneShot(jumpSound);
            animator.SetBool("jump", true);
            rigidBody.velocity = Vector2.up * jumpForce;
        }
        else
        {
            animator.SetBool("jump", false);
        }

    }

    // check if the player is on the ground to allow for a jump (this prevents jumping while in the air)
    bool isGrounded()
    {
        RaycastHit2D raycastHit = Physics2D.BoxCast(boxCollider.bounds.center, boxCollider.bounds.size, 0f, Vector2.down, 0.1f, groundLayerMask);
        return raycastHit.collider != null;
    }

    // the attack function
    public void PointerDownAttack()
    {
        shooting = true;
    }

    public void PointerUpAttack()
    {
        shooting = false;
    }

    public void Attack()
    {
        // this is also the fire rate - makes sure the player cannot shoot too quickly
        if(timeBtwAttacks <= 0)
        {
            if (shooting && skillMenuCheck.skillMenuActive == false)
            {
                audioSource.PlayOneShot(shootSound);
                StartCoroutine(muzzleFlash());
                Instantiate(projectile, aimPoint.position, aimPoint.rotation);
                timeBtwAttacks = startBtwAttacks;
            }
            else
            {
                animator.SetBool("attack", false);
            }
        }
        else
        {
            timeBtwAttacks -= Time.deltaTime;
        }
        
    }

    // the muzzle flash function syncs the muzzle flash itself with the actual shooting function
    IEnumerator muzzleFlash()
    {
        fireEffect.SetActive(true);
        yield return new WaitForSeconds(0.05f);
        fireEffect.SetActive(false);

        StopCoroutine(muzzleFlash());
    }

    // a small coroutine to wait for 5 seconds
    IEnumerator WaitSomeTime()
    {
        yield return new WaitForSeconds(5f);
        StopCoroutine(WaitSomeTime());
    }

    void OnCollisionEnter2D(Collision2D collision)
    {
        if(collision.gameObject.CompareTag("platform"))
        {
            transform.parent = collision.gameObject.transform;
        }
    }

    void OnCollisionExit2D(Collision2D collision)
    {
        if(collision.gameObject.CompareTag("platform"))
        {
            transform.parent = null;
        }
    }
}