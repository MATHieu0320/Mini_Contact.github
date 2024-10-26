<?php session_start(); ?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>

<body>
    <a href=<?php session_destroy(); ?>>d</a>
    <?php $dataPost = $_POST;

    $tableauClient = [

        [
            "Email" => "pa@gmail.com",
            "Password" => "pa",
        ],
        [
            "Email" => "patric@gmail.com",
            "Password" => "patric",
        ],
        [
            "Email" => "bastien@gmail.com",
            "Password" => "bastien",
        ]


    ];

    if (
        !isset($dataPost["email"])
        || !filter_var($dataPost["email"], FILTER_VALIDATE_EMAIL)
        || !isset($dataPost["text"])
        || !isset($dataPost["area"])
        || empty($dataPost["text"])
        || empty($dataPost["area"])
    ) {
        // echo "non";
    } else {
        foreach ($tableauClient as $key) {
            if ($key["Email"] === $dataPost["email"]) {


                $_SESSION["confirmer"] = [
                    "mail" => $dataPost["email"]
                ];
                echo $_SESSION["confirmer"]["mail"];
            }
        }

        if (isset($_SESSION["confirmer"])) {
            echo "reste la";
            try {
                $baseDeDonnee = new PDO('mysql:host=localhost;port=3307;dbname=validation;charset=utf8', 'root', "root", [PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION]);

            } catch (Exception $e) {
                die('Erreur : ' . $e->getMessage());
            }


            $sql = 'INSERT INTO information (Email,Prenom,commentaire) VALUES (:Email,:Prenom,:commentaire)';
            $preparation = $baseDeDonnee->prepare($sql);
            $preparation = $preparation->execute(
                [
                    "Email" => $dataPost["email"],
                    "Prenom" => $dataPost["text"],
                    "commentaire" => $dataPost["date"]
                ]
            );



        } else {
            echo "non";
        }


    }

    ?>
</body>

</html>