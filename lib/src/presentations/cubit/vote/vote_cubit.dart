import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'vote_state.dart';

class VoteCubit extends Cubit<VoteState> {
  VoteCubit() : super(const VoteState(-1, -1));

  int _voteUpCount = 0;
  int _vote = -1;

  Future<void> initVoteCount(int voteCount) async {
    _voteUpCount = voteCount;
    emit(VoteState(_vote, _voteUpCount));
  }

  Future<void> initVote(int voteUp) async {
    _vote = voteUp;
    emit(VoteState(_vote, _voteUpCount));
  }

  Future<void> changeVote() async {
    if (_vote != 1) {
      _vote = 1;
      _voteUpCount++;
    } else {
      _vote = 0;
      _voteUpCount--;
    }
    emit(VoteState(_vote, _voteUpCount));
  }
}
