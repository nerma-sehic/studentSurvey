<%@ page import="studentSurvey.Survey studentSurvey.SurveyController" %>
<div class="custom-table">
    <div class="row custom-table-header no-margin">
        <div class="col-md-12 col-xs-12 no-overflow text-center">
            <br><p style="font-size:25px;">
            <b>Profesor: ${currentProfessor.firstName}&nbsp;${currentProfessor.lastName}</b>
            </p>
        </div>
        <div class="col-md-12 col-xs-12 no-overflow text-center">
            <br><p style="font-size:25px;">
            <b>Kolegij: ${currentSubject.name}</b>
        </p>
        </div>
        <div class="col-md-12 col-xs-12 no-overflow text-center">
            <br><p style="font-size:25px;">
                <b>ANKETA</b>
             </p>
             <br>
        </div>
    </div>
    <g:set var="brojPitanja" value="${1}"/>
    <div class="custom-table-data">

            <div class="row custom-table-data-one-row no-margin">
                    <div class="col-md-12 col-xs-12 no-overflow">
                        <div class="form-group has-feedback">
                            <div class="col-sm-12">
                             <h4> <label class="control-label col-sm-12">${brojPitanja}. ${questionList[0]?.questionText}</label></h4>
                            </div>

                            <div class="col-offset-sm-6 col-sm-10 col-xs-6 text-right">
                                <div class="col-sm-3">
                                    <h4> ${answerList[0].comment}</h4>
                                </div>
                                <div class="col-sm-3">
                                    <h4>  ${answerList[1].comment} </h4>
                                </div>
                            </div>

                            <div class="col-offset-sm-6 col-sm-10 col-xs-6 text-right">
                                <div class="col-sm-3">
                                    <input type="radio" name="pitanje-${questionList[0].id}" value="${answerList[0].comment}">
                                </div>
                                <div class="col-sm-3">
                                    <input type="radio" name="pitanje-${questionList[0].id}" value="${answerList[1].comment}">
                                </div>
                            </div>
                        </div><br><br>
                    </div>
            </div>


            <div class="row custom-table-data-one-row no-margin">
                <div class="col-md-12 col-xs-12 no-overflow">
                    <div class="form-group has-feedback">
                        <div class="col-sm-12">
                            <h4><label class="control-label col-sm-12">${brojPitanja+1}. ${questionList[1]?.questionText}</label></h4>
                        </div>

                        <div class="col-offset-sm-6 col-sm-10 col-xs-6 text-right">
                            <div class="col-sm-3">
                               <h4> ${answerList[8].comment}</h4>
                            </div>
                            <div class="col-sm-3">
                                <h4>  ${answerList[9].comment} </h4>
                            </div>
                        </div>

                        <div class="col-offset-sm-6 col-sm-10 col-xs-6 text-right">
                            <div class="col-sm-3">
                                <input type="radio" name="pitanje-${questionList[1].id}" value="${answerList[8].comment}">
                            </div>
                            <div class="col-sm-3">
                                <input type="radio" name="pitanje-${questionList[1].id}" value="${answerList[9].comment}">
                            </div>
                        </div>
                    </div><br><br>
                </div>
            </div>

    <div class="row custom-table-data-one-row no-margin">
        <div class="col-md-12 col-xs-12 no-overflow">
            <div class="form-group has-feedback">
                <div class="col-sm-12">
                    <h4><label class="control-label col-sm-12">${brojPitanja+2}. ${questionList[2]?.questionText}</label></h4>
                </div>

                <div class="col-offset-sm-6 col-sm-10 col-xs-6 text-right">
                    <div class="col-sm-2">
                        <h4> ${answerList[2].comment}</h4>
                    </div>
                    <div class="col-sm-2">
                        <h4>  ${answerList[3].comment} </h4>
                    </div>
                    <div class="col-sm-2">
                        <h4>  ${answerList[4].comment} </h4>
                    </div>
                    <div class="col-sm-2">
                        <h4>  ${answerList[5].comment} </h4>
                    </div>
                    <div class="col-sm-2">
                        <h4>  ${answerList[6].comment} </h4>
                    </div>
                </div>

                <div class="col-offset-sm-6 col-sm-10 col-xs-6 text-right">
                    <div class="col-sm-2">
                        <input type="radio" name="pitanje-${questionList[2].id}" value="${answerList[2].comment}">
                    </div>
                    <div class="col-sm-2">
                        <input type="radio" name="pitanje-${questionList[2].id}" value="${answerList[3].comment}">
                    </div>
                    <div class="col-sm-2">
                        <input type="radio" name="pitanje-${questionList[2].id}" value="${answerList[4].comment}">
                    </div>
                    <div class="col-sm-2">
                        <input type="radio" name="pitanje-${questionList[2].id}" value="${answerList[5].comment}">
                    </div>
                    <div class="col-sm-2">
                        <input type="radio" name="pitanje-${questionList[2].id}" value="${answerList[6].comment}">
                    </div>
                </div>
            </div><br><br>
        </div>
    </div>



    <div class="row custom-table-data-one-row no-margin">
        <div class="col-md-12 col-xs-12 no-overflow">
            <div class="form-group has-feedback">
                <div class="col-sm-12">
                    <h4><label class="control-label col-sm-12">${brojPitanja+3}. ${questionList[3]?.questionText}</label></h4>
                </div>

                <div class="col-offset-sm-6 col-sm-10 col-xs-6 text-right">
                    <div class="col-sm-3">
                        <h4> ${answerList[8].comment}</h4>
                    </div>
                    <div class="col-sm-3">
                        <h4>  ${answerList[9].comment} </h4>
                    </div>
                </div>

                <div class="col-offset-sm-6 col-sm-10 col-xs-6 text-right">
                    <div class="col-sm-3">
                        <input type="radio" name="pitanje-${questionList[3].id}" value="${answerList[8].comment}">
                    </div>
                    <div class="col-sm-3">
                        <input type="radio" name="pitanje-${questionList[3].id}" value="${answerList[9].comment}">
                    </div>
                </div>
            </div><br><br>
        </div>
    </div>


    <div class="row custom-table-data-one-row no-margin">
        <div class="col-md-12 col-xs-12 no-overflow">
            <div class="form-group has-feedback">
                <div class="col-sm-12">
                    <h4><label class="control-label col-sm-12">${brojPitanja+4}. ${questionList[4]?.questionText}</label></h4>
                </div>

                <div class="col-offset-sm-6 col-sm-10 col-xs-6 text-right">
                    <div class="col-sm-3">
                        <h4> ${answerList[8].comment}</h4>
                    </div>
                    <div class="col-sm-3">
                        <h4>  ${answerList[9].comment} </h4>
                    </div>
                </div>

                <div class="col-offset-sm-6 col-sm-10 col-xs-6 text-right">
                    <div class="col-sm-3">
                        <input type="radio" name="pitanje-${questionList[4].id}" value="${answerList[8].comment}">
                    </div>
                    <div class="col-sm-3">
                        <input type="radio" name="pitanje-${questionList[4].id}" value="${answerList[9].comment}">
                    </div>
                </div>
            </div><br><br>
        </div>
    </div>

    <div class="row custom-table-data-one-row no-margin">
        <div class="col-md-12 col-xs-12 no-overflow">
            <div class="form-group has-feedback">
                <div class="col-sm-12">
                    <h4><label class="control-label col-sm-12">${brojPitanja+5}. ${questionList[5]?.questionText}</label></h4>
                </div>
                <div class="col-sm-12 text-center">

                    <textarea name="pitanje-${questionList[5].id}"
                              cols="75"
                              rows="1,5"
                              style="margin-top: 20px;"
                              value=""></textarea>

                    %{--<input type="text"--}%
                           %{--cols="40"--}%
                           %{--rows="5"--}%
                           %{--name="pitanje-${questionList[5].id}"--}%
                           %{--value="" style="margin-top: 20px;">--}%
                    <br><br>
                </div>
            </div><br>
        </div>
    </div>

            %{--<div class="row custom-table-data-one-row no-margin">--}%
                %{--<div class="col-md-12 col-xs-12 no-overflow">--}%
                    %{--<div class="form-group has-feedback">--}%
                        %{--<div class="col-sm-12">--}%
                            %{--<label class="control-label col-sm-12">${brojPitanja+2}. ${questionList[2]?.questionText}:</label>--}%
                        %{--</div>--}%

                        %{--<div class="col-offset-sm-2 col-sm-2">--}%
                            %{--<div class="col-sm-2">--}%
                                %{--${answerList[2].comment}--}%
                            %{--</div>--}%
                            %{--<div class="col-sm-2">--}%
                                %{--${answerList[3].comment}--}%
                            %{--</div>--}%

                            %{--<div class="col-sm-2">--}%
                                %{--${answerList[4].comment}--}%
                            %{--</div>--}%

                            %{--<div class="col-sm-2">--}%
                                %{--${answerList[5].comment}--}%
                            %{--</div>--}%

                            %{--<div class="col-sm-2">--}%
                                %{--${answerList[6].comment}--}%
                            %{--</div>--}%
                        %{--</div>--}%

                        %{--<div class="col-offset-sm-2 col-sm-10">--}%
                            %{--<div class="col-sm-2">--}%
                                %{--<input type="radio" name="pitanjeIneteres" value="${answerList[2].comment}">--}%
                            %{--</div>--}%
                            %{--<div class="col-sm-2">--}%
                                %{--<input type="radio" name="pitanjeIneteres" value="${answerList[3].comment}">--}%
                            %{--</div>--}%

                            %{--<div class="col-sm-2">--}%
                                %{--<input type="radio" name="pitanjeIneteres" value="${answerList[4].comment}">--}%
                            %{--</div>--}%

                            %{--<div class="col-sm-2">--}%
                                %{--<input type="radio" name="pitanjeIneteres" value="${answerList[5].comment}">--}%
                            %{--</div>--}%

                            %{--<div class="col-sm-2">--}%
                                %{--<input type="radio" name="pitanjeIneteres" value="${answerList[6].comment}">--}%
                            %{--</div>--}%
                        %{--</div>--}%
                    %{--</div><br>--}%
                %{--</div>--}%
            %{--</div>--}%


            <div class="row custom-table-data-one-row no-margin">
                <div class="col-md-12 col-xs-12 no-overflow">
                    <div class="form-group has-feedback">
                        <label class="control-label col-sm-12">${brojPitanja+18}. ${questionList[18]?.questionText}</label>
                        <div class="col-sm-12">
                            <input type="text" name="pitanjeKritike" value=""><br><br>
                        </div>
                    </div><br>
                </div>
            </div>

    </div>
</div>
