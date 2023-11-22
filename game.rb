class Game
    attr_accessor :kick_off

    def initialize(kick_off)
        @kick_off = kick_off
    end

    # じゃんけんをする
    def janken
        puts "最初はグー、じゃんけん・・・"
        puts "グーなら[0]／チョキなら[1]／パーなら[2]／戦わないなら[3]／を入力してください"

        select_number = gets # ユーザーの入力値を取得
        random_number = rand(3) # 相手が出す手を0~3の中からランダムに出力させる
       
        # 入力値が整数以外なら、早期return（=処理を終了）
        if select_number =~ /^[0-9]+$/
            select_number = select_number.to_i
        else
            return puts "入力された値は無効です"
        end

        # 入力値が3以上なら、早期return（=処理を終了）
        select_number = select_number.to_i
        if select_number > 4
            return puts "[0],[1],[2],[3]を入力してください"
        end

        # 入力値が3なら早期return（=処理を終了）
        if select_number == 3 
            puts "戦わないが選択されました。ゲームを終了します。"
            exit   
        end

        # 入力値が0,1,2,3の場合は、ゲームを開始する
        jankens = ["グー","チョキ","パー"]
        puts "----------"
        puts "ポンッ"
        puts "【あなた：#{jankens[select_number]}】【相手：#{jankens[random_number]}】"
                
        if select_number == random_number
            puts "あいこ！もう1度！"
            return true
        elsif select_number == 0 && random_number == 1 || select_number == 1 && random_number == 2 || select_number == 2 && random_number == 0
            puts "じゃんけんに勝ちました！"
            @winner = "player"
            attimuite_hoi
        elsif select_number == 0 && random_number == 2 || select_number == 1 && random_number == 0 || select_number == 2 && random_number == 1
            puts "じゃんけんに負けました！"
            @winner = "program"
            attimuite_hoi
        else
            exit
        end
    end

    # あっち向いてホイをする
    def attimuite_hoi
        puts "--------------------"
        puts "上なら[0]／下なら[1]／右なら[2]／左なら[3]／を入力してください"
        puts "あっち向いて〜"

        select_number2 = gets # ユーザーの入力値を取得
        random_number2 = rand(3) # 相手が出す手を0~3の中からランダムに出力させる  
        puts "----------"  
        puts "ホイッ"
    
        # 入力値が整数以外なら、早期return（=処理を終了）
        if select_number2 =~ /^[0-9]+$/
            select_number2 = select_number2.to_i
        else
            return puts "入力された値は無効です"
        end

        # 入力値が3以上なら、早期return（=処理を終了）
        select_number2 = select_number2.to_i
        if select_number2 > 4
            return puts "[0],[1],[2],[3]を入力してください"
        end

        # 入力値が0,1,2,3の場合は、ゲームを開始する
        muki = ["上","下","右","左"]
        puts "【あなた：#{muki[select_number2]}】【相手：#{muki[random_number2]}】"

        if select_number2 == random_number2 && @winner == "player"
            puts "あなたの勝ち！おめでとう！"
            puts "--------------------"
            return false
        elsif (select_number2 == random_number2 && @winner == "program")
            puts "あなたの負け！ゲームセット！"
            puts "--------------------"
            return false
        else
            puts "セーフ・・・もう1度！"
            puts "--------------------"
            janken
        end
    end
end

next_game = true # あいこの際はtrueを返し、next_game = trueに処理が渡ってじゃんけんの処理を繰り返す

while next_game
    repeat = Game.new(@kick_off)
    next_game = repeat.janken
end