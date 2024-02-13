$(function(){
    // header control
    $("button.gnb__link, .usermenu__button").on("click", function(){
        let tabindex = $(this).next("ul").hasClass("is-open")?-1:0;

        $(this).next("ul").toggleClass("is-open");
        $(this).next("ul").find("a, button").attr("tabindex", tabindex);
    });

    // component
    $(".c-select__button").on("click", function(){
        $(this).parent(".c-select").toggleClass("is-open");
        $(this).next("ul").stop().slideToggle();
    });

    $(".c-input .input__masking").on("click", function(){
        const changeType = $(this).prev("input").attr("type") == "text";

        $(this).prevAll("input").attr("type", changeType?"password":"text");
        $(this).children(".ico").hide();
        if(!changeType) {
            $(this).children(".ico--pw-show").show();
        } else {
            $(this).children(".ico--pw-hide").show();
        }
    });

    $(".c-input .input__remove").on("click", function(){
        $(this).prevAll("input").val("");
    });

    /* c-calendar */
    let today = new Date();
    let targetDate = new Date();
    const monthTarget = $(".c-calendar__month");
    const tbodyTarget = $(".c-calendar tbody");
    const prevMonthBtn = $(".c-calendar__month-btn--prev");
    const nextMonthBtn = $(".c-calendar__month-btn--next");

    drawCalendar();

    prevMonthBtn.on("click", function(){
        targetDate = new Date(targetDate.getFullYear(), targetDate.getMonth() - 1, targetDate.getDate());
        drawCalendar();
    });

    nextMonthBtn.on("click", function(){
        targetDate = new Date(targetDate.getFullYear(), targetDate.getMonth() + 1, targetDate.getDate());
        drawCalendar();
    });

    function drawCalendar(){
        let addTr = '';
        let monStart, prevDay;
        let firstDate = new Date(targetDate.getFullYear(), targetDate.getMonth(), 1);     // 월의 1일
        let lastDate = new Date(targetDate.getFullYear(), targetDate.getMonth() + 1, 0);  // 월의 마지막날
        let prevLastDate = new Date(targetDate.getFullYear(), targetDate.getMonth(), 0);  // 이전 달의 마지막날

        monthTarget.html(targetDate.getFullYear()+"년 "+String(targetDate.getMonth()+1).padStart(2, "0")+"월");
        
        monStart = 7-firstDate.getDay()==7?0:firstDate.getDay();
        prevDay = prevLastDate.getDate() - monStart + 1;
        nextMonDay = 7-(lastDate.getDay()+1);

        for(let i=1,j=1;i<=lastDate.getDate()+monStart+nextMonDay;i++) {
        let isToday = targetDate.getMonth()==today.getMonth() && i-monStart==today.getDate();
        if(i%7 == 1) {
            addTr += `<tr>`;
        }

        // button 안쪽에 data가 있으면 넣고/아니면 안보이게 처리하는게 필요할듯
        // 일단은 임시로 이달에 해당하는 날짜에는 전부 데이터 넣기 처리
        addTr += `
            <td>
            ${i<=monStart || !(i<=monStart+prevDay) ? `
            <span class="c-calendar__day not-this-month">
            `:`
            <button type="button" class="c-calendar__day btn-modal ${isToday?'is-today':''}" data-link="read-record" title="가계 내역 보기">
            `}
                <strong class="c-calendar__day-date" ${isToday?'title="오늘"':''}>
                ${( i<=monStart ? prevDay++ : i<=monStart+prevDay ? i-monStart : j++ )}
                </strong>

                ${!(i<=monStart) && i<=monStart+prevDay ? `<span class="c-calendar__day-money-wrap">
                <span class="c-calendar__day-money decrease"><span class="blind">지출 </span>123,450<span class="blind">원</span></span>
                <span class="c-calendar__day-money increase"><span class="blind">수입 </span>123,450<span class="blind">원</span></span>
                </span>`:''}
            ${i<=monStart || !(i<=monStart+prevDay) ? `</span>`:`</button>`}
            </td>`; 
            if(i%7 == 0) {
            addTr += `</tr>`;
            }
        }
    
        tbodyTarget.html(addTr);
    }
    
    $(".btn--now").on("click", function() {
	    // 현재 날짜로 초기화
	    targetDate = new Date();
	    drawCalendar();
	});
    
    $(".btn-modal").on("click", function(){
        const modalType = $(this).attr("data-link");
        $(`.dim, .c-modal[data-modal="${modalType}"]`).stop().fadeIn().css("display","flex");
    });

    $(".c-modal .c-modal__btn--close, .c-modal__footer .c-button.close").on("click", function(){
        $(this).parents(".c-modal").stop().fadeOut(function(){
            allClose = true;
            $(".dim").children().each(function(){
                console.log($(this).css('display'));
                if($(this).css('display') != 'none'){
                    allClose = false;
                }
            });
        
            if(allClose) {
                $(this).parents(".dim").stop().fadeOut(100);
            }
        });
        
    });
});